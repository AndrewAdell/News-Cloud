import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/presentation/views/manager/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      emit(RegisterLoadingState());

      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (ex) { 
      if (ex.code == 'weak-password') { 
        emit(RegisterFailedState(erroMessage: 'The password provided is too weak.'));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFailedState(erroMessage: 'The account already exists for that email.'));
      } else if (ex.code == 'invalid-email') {
        emit(RegisterFailedState(erroMessage: 'The email address is badly formatted.'));
      } else {
        emit(RegisterFailedState(erroMessage: 'Registration failed. Please try again.'));
      }
    } catch (e) {
      emit(RegisterFailedState(erroMessage: 'Something went wrong. Please try again later.'));
    }
  }
}
