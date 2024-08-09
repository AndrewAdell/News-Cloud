abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterFailedState extends RegisterStates {
final  String erroMessage;

  RegisterFailedState({required this.erroMessage});

}
