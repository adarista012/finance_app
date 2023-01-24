import 'package:finance_app/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:flutter_meedu/meedu.dart';
import '../domain/repositories/authentication_repository.dart';

Future<void> injectDependencies() async {

  Get.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(),
  );

}