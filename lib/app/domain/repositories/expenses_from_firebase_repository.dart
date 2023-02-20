import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/app/domain/models/expense.dart';

abstract class ExpensesFromFirebaseRepository {
  Stream<QuerySnapshot<Object?>> getFirebaseExpenses();
  Future<void> removeExpense(Expense expense);
  Future<void> uploadExpenseToFirebaseFirestore({
    required double currentPrice,
    required String currentDetail,
    required DateTime dateTime,
    required String currentImageUrl,
    required String currentImagePath,
  });
  Future<void> uploadImageToFirebaseStorage({
    required String hash,
    required File? currentImage,
  });
  Future<void> getUrl(String hash);
}
