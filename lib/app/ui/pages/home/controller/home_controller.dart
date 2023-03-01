import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/app/domain/models/expense.dart';
import 'package:finance_app/app/domain/repositories/expenses_from_firebase_repository.dart';
import 'package:finance_app/app/domain/repositories/picker_image_repository.dart';
import 'package:finance_app/app/ui/global_controllers/session_controller.dart';
import 'package:finance_app/app/ui/pages/home/widgets/my_dismissble.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends SimpleNotifier {
  HomeController() {
    _init();
  }

  void _init() {
    getFirebaseExpenses();
  }

  void reloadListDismissible() {
    getFirebaseExpenses();
  }

  // final CollectionReference _expenses =
  //     FirebaseFirestore.instance.collection('expenses');
  double _totalAmount = 0;
  double get totalAmmount => _totalAmount;
  // List<Expense> _list = [];
  // List<Expense> get list => _list;
  List<MyDismissible> _listDismissibles = [];
  List<MyDismissible> get listDismissibles => _listDismissibles;
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  // final _auth = Get.find<AuthenticationRepository>();

  double _currentPrice = 0;
  double get currentPrice => _currentPrice;
  String? _currentDetail;
  String? get currentDetail => _currentDetail;

  String? _currentImageUrl;
  String? get currentImageUrl => _currentImageUrl;

  String? _currentImagePath;
  String? get currentImagePath => _currentImagePath;

  File? _currentImage;
  File? get currentImage => _currentImage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final _imagePicker = Get.find<PickerImageRepository>();
  final _firebase = Get.find<ExpensesFromFirebaseRepository>();

  // bool _isUpload = false;
  // bool get isUpload => _isUpload;

  // Future<void> logOut() async {
  //   await _auth.singOut();
  //   router.pushNamedAndRemoveUntil(Routes.LOGIN);
  // }

  void setCurrentPrice(double doubleAmount) => _currentPrice = doubleAmount;
  void setCurrentDetail(String? currentDetail) =>
      _currentDetail = currentDetail;
  void setCurrentImageUrl(String? currentImageUrl) {
    _currentImageUrl = currentImageUrl;
  }

  void setCurrentImagePath(String? currentImagePath) {
    _currentImagePath = currentImagePath;
    notify();
  }

  void setCurrentImage(File? currentImage) {
    _currentImage = currentImage;
    notify();
  }

  Future<void> pickerImage(ImageSource source) async {
    final img = await _imagePicker.pickerImage(source);
    setCurrentImage(img);
    notify();
  }

  double amount() {
    double total = 0;
    for (var element in _listDismissibles) {
      total = total + element.expense.price;
    }
    _totalAmount = total;
    notify();
    return _totalAmount;
  }

  Future<void> uploadImageToFirebaseStorage(String hash) async {
    await _firebase.uploadImageToFirebaseStorage(
        hash: hash, currentImage: _currentImage);
  }

  Future<void> getUrl(String hash) async {
    await _firebase.getUrl(hash);
  }

  Future<void> uploadExpenseToFirebaseFirestore() async {
    await _firebase.uploadExpenseToFirebaseFirestore(
      currentPrice: _currentPrice,
      currentDetail: _currentDetail,
      dateTime: DateTime.now(),
      currentImageUrl: _currentImageUrl,
      currentImagePath: _currentImagePath,
    );
  }

  Future<void> deleteImagetoFirebaseStorage(String hash) async {
    final storageRef = FirebaseStorage.instance.ref();
    final desertRef = storageRef.child(hash);
    await desertRef.delete();
  }

  Future<void> addExpense() async {
    if (_currentImage != null) {
      await uploadImageToFirebaseStorage(_currentImage!.hashCode.toString());
      await uploadExpenseToFirebaseFirestore();
    } else {
      await uploadExpenseToFirebaseFirestore();
    }
  }

  Future<void> removeExpense(Expense expense) async {
    _firebase.removeExpense(expense);
    notify();
  }

  Future<void> getFirebaseExpenses() async {
    _isLoading = true;
    final Stream<QuerySnapshot> expensesStream =
        _firebase.getFirebaseExpenses();
    expensesStream.forEach(
      (event) {
        _listDismissibles = event.docs.map(
          (e) {
            sessionProvider.read.user?.email;
            return MyDismissible(
              expense: Expense(
                price: e.get('price'),
                detail: e.get('detail'),
                category: null,
                date: DateTime.fromMicrosecondsSinceEpoch(e.get('date')),
                pictureUrl: null,
                picturePath: null,
                id: e.id,
              ),
            );
          },
        ).toList();
        _totalAmount = amount();
        _isLoading = false;
        notify();
      },
    );
  }
}

// final ww = StreamBuilder(
//     stream: FirebaseFirestore.instance
//         .collection('expenses')
//         .orderBy('date', descending: true)
//         .snapshots(),
//     builder: (_, __) {
//       print(__.connectionState);
//       if (__.connectionState == ConnectionState.waiting) {
//         return const CircularProgressIndicator();
//       }

//       ;
//       if (__.hasError) {
//         return Text(__.error.toString());
//       }
//       if (__.hasData) {
//         if (__.data != null) {
//           List<MyDismissible> list = __.data!.docs.map(((e) {
//             return MyDismissible(
//               expense: Expense(
//                 price: e.get('price'),
//                 detail: e.get('detail'),
//                 category: null,
//                 date: (e.get('date') as Timestamp).toDate(),
//                 pictureUrl: null,
//                 picturePath: e.get('imagePath'),
//                 id: e.id,
//               ),
//             );
//           })).toList();

//           return ListView(
//             children: list,
//           );
//         }
//         return Text('null');
//       }
//       return const CircularProgressIndicator();
//     });
