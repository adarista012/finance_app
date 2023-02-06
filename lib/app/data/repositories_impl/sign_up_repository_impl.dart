import 'package:finance_app/app/domain/inputs/sign_up.dart';
import 'package:finance_app/app/domain/repositories/sign_up_repository.dart';
import 'package:finance_app/app/domain/response/sign_up_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingUpRepositoryImpl implements SingUpRepository {
  final FirebaseAuth _auth;
  SingUpRepositoryImpl(this._auth);
  @override
  Future<SignUpResponse> register(SignUpData data) async {
    try {
      // ignore: non_constant_identifier_names
      final UserCredential = await _auth.createUserWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
      await UserCredential.user!.updateDisplayName(data.name);
      return SignUpResponse(null, UserCredential.user);
    } on FirebaseException catch (e) {
      return SignUpResponse(parseStringToSignUpError(e.code), null);
    }
  }
}
