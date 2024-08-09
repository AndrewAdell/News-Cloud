import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/presentation/views/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoadingState());

      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(LoginSuccessState());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'wrong-password') {
        emit(LoginFailedState(erroMessage: 'Incorrect password. Please try again.'));
      } else if (ex.code == 'user-not-found') {
        emit(LoginFailedState(erroMessage: 'No user found with this email.'));
      } else if (ex.code == 'invalid-email') {
        emit(LoginFailedState(erroMessage: 'The email address is badly formatted.'));
      } else if (ex.code == 'user-disabled') {
        emit(LoginFailedState(erroMessage: 'This user has been disabled.'));
      } else {
        emit(LoginFailedState(erroMessage: 'Authentication failed. Please try again.'));
      }
    } catch (e) {
      emit(LoginFailedState(erroMessage: 'Something went wrong. Please try again later.'));
    }
  }
}
