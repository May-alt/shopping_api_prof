part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterChangeVisibiltyPassword extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
   final LoginModel loginModel;
  RegisterSuccessState(this.loginModel);
}

class RegisterErrorState extends RegisterState {
  final String Error;

  RegisterErrorState(this.Error);
}
