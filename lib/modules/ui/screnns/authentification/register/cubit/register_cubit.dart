import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_api_prof/layout/constants/const_link_url.dart';
import 'package:shopping_api_prof/models/user_models.dart';
import 'package:shopping_api_prof/network/remote/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());


  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword= true;

  IconData suffix = Icons.visibility_outlined;
//Icons.remove_red_eye

void changeVisibiltyIconsPassword(){
  isPassword = ! isPassword;
  suffix = isPassword ? Icons.remove_red_eye : Icons.visibility_outlined;
  emit(RegisterChangeVisibiltyPassword());
}


late LoginModel loginModel;

void UserReigter({
  required String name,
  required String  email,
  required String  phone,
  required String password
}){
emit(RegisterLoadingState());
  DioHelper.postData(
      url: REGISTER,
      data: {
        'name' :name,
        'email' :email,
        'phone' :phone,
        'password' :password,
      }).
  then((value){
    loginModel = LoginModel.fromJson(value.data);
    print(loginModel.data?.name);
    print(loginModel.data?.token);
    emit(RegisterSuccessState(loginModel));

  }).
  catchError((onError){
    print(onError.toString());
    emit(RegisterErrorState(onError.toString()));
  });
}



}
