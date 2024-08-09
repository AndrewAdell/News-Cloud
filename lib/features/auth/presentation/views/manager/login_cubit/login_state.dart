abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginFailedState extends LoginStates {
final  String erroMessage;

  LoginFailedState({required this.erroMessage});

}