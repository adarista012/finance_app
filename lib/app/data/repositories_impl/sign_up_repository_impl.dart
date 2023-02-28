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
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
      await userCredential.user!.updateDisplayName(data.name);
      final user = userCredential.user;
      if (!user!.emailVerified) {
        await user.sendEmailVerification();
      }
      return SignUpResponse(
        null,
        userCredential.user,
      );
    } on FirebaseException catch (e) {
      return SignUpResponse(
        parseStringToSignUpError(e.code),
        null,
      );
    }
  }
}
