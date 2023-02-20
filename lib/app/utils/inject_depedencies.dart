import 'package:finance_app/app/data/repositories_impl/account_repository_impl.dart';
import 'package:finance_app/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:finance_app/app/data/repositories_impl/expenses_from_firebase_repository_impl.dart';
import 'package:finance_app/app/data/repositories_impl/picker_image_repository_impl.dart';
import 'package:finance_app/app/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:finance_app/app/domain/repositories/account_repository.dart';
import 'package:finance_app/app/domain/repositories/expenses_from_firebase_repository.dart';
import 'package:finance_app/app/domain/repositories/picker_image_repository.dart';
import 'package:finance_app/app/domain/repositories/sign_up_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../domain/repositories/authentication_repository.dart';

Future<void> injectDependencies() async {
  Get.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      firebaseAuth: FirebaseAuth.instance,
      googleSignIn: GoogleSignIn(),
    ),
  );

  Get.lazyPut<SingUpRepository>(
    () => SingUpRepositoryImpl(FirebaseAuth.instance),
  );

  Get.lazyPut<AccountRepository>(
    () => AccountRepositoryImpl(FirebaseAuth.instance),
  );

  Get.lazyPut<PickerImageRepository>(
    () => PickerImageRepositoryImpl(),
  );

  Get.lazyPut<ExpensesFromFirebaseRepository>(
    () => ExpensesFromFirebaseRepositoryImpl(),
  );
}
