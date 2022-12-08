part of 'applogin_cubit.dart';

@immutable
abstract class ApploginState {}

class ApploginInitial extends ApploginState {}

class ApploginObsucureChange extends ApploginState{}

class ApploginLoadingState extends ApploginState{}

class ApploginSuccessgState extends ApploginState{
  final LoginModel loginModel;
  ApploginSuccessgState(this.loginModel);
}
class ApploginErrorgState extends ApploginState{
  final String error;
  ApploginErrorgState(this.error);
}
