import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/app/domain/models/expense.dart';
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

  void reload() {
    getFirebaseExpenses();
  }

  final CollectionReference _expenses =
      FirebaseFirestore.instance.collection('expenses');
  final Stream<QuerySnapshot> expensesStreamS = FirebaseFirestore.instance
      .collection('expenses')
      .orderBy('date', descending: true)
      .snapshots();
  double _totalAmount = 0;
  double get totalAmmount => _totalAmount;
  List<Expense> _list = [];
  List<Expense> get list => _list;
  List<MyDismissible> _listDismissibles = [];
  List<MyDismissible> get listDismissibles => _listDismissibles;
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  double _currentPrice = 0;
  double get currentPrice => _currentPrice;
  String _currentDetail = 'empty';
  String get currentDetail => _currentDetail;

  String _currentImageUrl = 'empty';
  String get currentImageUrl => _currentImageUrl;

  String _currentImagePath = 'empty';
  String get currentImagePath => _currentImagePath;

  File? _currentImage;
  File? get currentImage => _currentImage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isUpload = false;
  bool get isUpload => _isUpload;

  void setCurrentPrice(double doubleAmount) => _currentPrice = doubleAmount;
  void setCurrentDetail(String currentDetail) => _currentDetail = currentDetail;
  void setCurrentImageUrl(String currentImageUrl) {
    _currentImageUrl = currentImageUrl;
  }

  void setCurrentImagePath(String currentImagePath) {
    _currentImagePath = currentImagePath;
    notify();
  }

  void setCurrentImage(File? currentImage) {
    _currentImage = currentImage;
    // notify();
  }

  Future pickerImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.getImage(source: source);
    if (image == null) return;
    File? img = File(image.path);
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
    final storageRef = FirebaseStorage.instance.ref().child('images/$hash.jpg');

    await storageRef.putFile(_currentImage!).then((snapshot) async {
      setCurrentImagePath(snapshot.ref.fullPath);
      await getUrl(hash);
    }).catchError((error) {});
  }

  Future<void> getUrl(String hash) async {
    final storageRef = FirebaseStorage.instance.ref().child('images/$hash.jpg');
    await storageRef.getDownloadURL().then(
      (url) {
        setCurrentImageUrl(url);
      },
    ).catchError((error) {});
  }

  Future<void> uploadExpenseToFirebaseFirestore() async {
    _expenses.add({
      'price': _currentPrice,
      'detail': _currentDetail,
      'date': DateTime.now(),
      'imageUrl': _currentImageUrl,
      'imagePath': _currentImagePath
    }).then((value) {
      setCurrentPrice(0);
      setCurrentDetail('empty');
      setCurrentImageUrl('empty');
      setCurrentImagePath('empty');
      setCurrentImage(null);
    }).catchError((error) {});
  }

  Future<void> deleteImagetoFirebaseStorage(String hash) async {
    print('=== delete on');
    final storageRef = FirebaseStorage.instance.ref();
    final desertRef = storageRef.child(hash);
    await desertRef.delete();
  }

  void addExpense() async {
    print('=== add expense on');
    if (_currentImage != null) {
      await uploadImageToFirebaseStorage(_currentImage!.hashCode.toString());
      print('=== upload finish');
      await uploadExpenseToFirebaseFirestore();
      print('=== add Expense finish');
    } else {
      await uploadExpenseToFirebaseFirestore();
    }

    // notify();
  }

  Future<void> removeExpense(Expense expense) async {
    CollectionReference expenses =
        FirebaseFirestore.instance.collection('expenses');
    expenses.doc(expense.id).delete().then((value) async {
      if (expense.picturePath != 'empty') {
        final storageRef = FirebaseStorage.instance.ref();
        final desertRef = storageRef.child(expense.picturePath!);
        await desertRef.delete();
      }
    }).catchError((error) {});
    notify();
  }

  final Stream<QuerySnapshot> expensesStream = FirebaseFirestore.instance
      .collection('expenses')
      .orderBy('date', descending: true)
      .snapshots();

  Future<void> getFirebaseExpenses() async {
    _isLoading = true;
    _list.clear();
    final Stream<QuerySnapshot> expensesStream = FirebaseFirestore.instance
        .collection('expenses')
        .orderBy('date', descending: true)
        .snapshots();
    expensesStream.forEach(
      (event) {
        _listDismissibles = event.docs.map(
          (e) {
            return MyDismissible(
              expense: Expense(
                price: e.get('price'),
                detail: e.get('detail'),
                category: null,
                date: (e.get('date') as Timestamp).toDate(),
                pictureUrl: null,
                picturePath: e.get('imagePath'),
                id: e.id,
              ),
            );
          },
        ).toList();
        print('end download list ----');
        _totalAmount = amount();
        _isLoading = false;
        notify();
      },
    );
  }
}
