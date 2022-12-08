import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_api_prof/layout/constants/const_link_url.dart';
import 'package:shopping_api_prof/models/user_models.dart';
import 'package:shopping_api_prof/network/remote/dio_helper.dart';

part 'applogin_state.dart';

class ApploginCubit extends Cubit<ApploginState> {
  ApploginCubit() : super(ApploginInitial());

  static ApploginCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;

  void userLogin({
    required String email,
    required String password})
  {
    emit(ApploginLoadingState());
    DioHelper.postData(url: LOGIN,
        data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(ApploginSuccessgState(loginModel));
      print(loginModel.message);
      print(loginModel.status);
      print(loginModel.data!.phone);
      print(loginModel.data!.token);
    }).catchError((onError) {
      print(onError.toString());
      emit(ApploginErrorgState(onError.toString()));
    });
  }

  bool isPassword = true;

  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ApploginObsucureChange());
  }

}
