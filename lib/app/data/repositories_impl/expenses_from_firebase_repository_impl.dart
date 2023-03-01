import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/app/domain/models/expense.dart';
import 'package:finance_app/app/domain/repositories/expenses_from_firebase_repository.dart';
import 'package:finance_app/app/ui/pages/home/controller/home_provider.dart';
import 'package:finance_app/app/utils/app_constants.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ExpensesFromFirebaseRepositoryImpl
    extends ExpensesFromFirebaseRepository {
  final _firebaseInstance =
      FirebaseFirestore.instance.collection(AppConstants.expenses);
  final _storageRef = FirebaseStorage.instance.ref();
  @override
  Stream<QuerySnapshot<Object?>> getFirebaseExpenses() {
    final Stream<QuerySnapshot> expensesStream = _firebaseInstance
        // .where(
        //   'date',
        //   isLessThan: '1643673600',
        // )
        .orderBy(AppConstants.date, descending: true)
        .snapshots();
    return expensesStream;
  }

  @override
  Future<void> removeExpense(Expense expense) async {
    _firebaseInstance.doc(expense.id).delete().then((value) async {
      if (expense.picturePath != AppConstants.empty) {
        final storageRef = _storageRef;
        final desertRef = storageRef.child(expense.picturePath!);
        await desertRef.delete();
      }
    }).catchError((error) {});
  }

  @override
  Future<void> uploadExpenseToFirebaseFirestore({
    required double currentPrice,
    required String? currentDetail,
    required DateTime dateTime,
    required String? currentImageUrl,
    required String? currentImagePath,
  }) async {
    await _firebaseInstance.add({
      'price': currentPrice,
      'detail': currentDetail,
      'date': dateTime.microsecondsSinceEpoch,
      'imageUrl': currentImageUrl,
      'imagePath': currentImagePath
    }).then((value) {
      homeProvider.read.setCurrentPrice(0);
      homeProvider.read.setCurrentDetail(AppConstants.empty);
      homeProvider.read.setCurrentImageUrl(AppConstants.empty);
      homeProvider.read.setCurrentImagePath(AppConstants.empty);
      homeProvider.read.setCurrentImage(null);
    }).catchError((error) {});
  }

  @override
  Future<void> getUrl(String hash) async {
    await _storageRef.child('images/$hash.jpg').getDownloadURL().then(
      (url) {
        homeProvider.read.setCurrentImageUrl(url);
      },
    ).catchError((error) {});
  }

  @override
  Future<void> uploadImageToFirebaseStorage({
    required String hash,
    required File? currentImage,
  }) async {
    await _storageRef
        .child('images/$hash.jpg')
        .putFile(currentImage!)
        .then((snapshot) async {
      homeProvider.read.setCurrentImagePath(snapshot.ref.fullPath);
      await getUrl(hash);
    }).catchError((error) {});
  }
}
