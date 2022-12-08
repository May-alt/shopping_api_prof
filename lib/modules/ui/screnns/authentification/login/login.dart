import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_api_prof/layout/constants/const_colors.dart';
import 'package:shopping_api_prof/layout/constants/const_link_url.dart';
import 'package:shopping_api_prof/layout/reusibale_widgets/const_widgets.dart';
import 'package:shopping_api_prof/layout/reusibale_widgets/reus_app_widgets.dart';
import 'package:shopping_api_prof/modules/ui/navigation/layouts_screnns.dart';
import 'package:shopping_api_prof/modules/ui/screnns/authentification/login/cubit/applogin_cubit.dart';
import 'package:shopping_api_prof/modules/ui/screnns/authentification/register/register.dart';


import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_api_prof/network/local/cache_helper.dart';

class LoginScrenn extends StatefulWidget {
  const LoginScrenn({Key? key}) : super(key: key);

  @override
  State<LoginScrenn> createState() => _LoginScrennState();
}

class _LoginScrennState extends State<LoginScrenn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApploginCubit(),
      child: BlocConsumer<ApploginCubit, ApploginState>(
        listener: (context, state) {

          if(state is ApploginSuccessgState)
          {
            //si status true nav to Home Screnns//
            if(state.loginModel.status){

              // print(state.loginModel.data!.token);
              //Save token and go to lyouts pages
              Cachehelper.saveData(key: 'token',
                  value: state.loginModel.data!.token).then((value) {
                tostShow(msg: state.loginModel.message, state: TostOptionState.SUCCESS);
                NavToAndRemove(context, LayoutsScrenns());

              });
              // print(state.loginModel.message);
              // tostShow(
              //     msg:state.loginModel.message ,
              //     state: TostOptionState.SUCCESS,
              // );

            }
            //si status false print error message//
            else{
              // print(state.loginModel.message);
              tostShow(
                  msg:state.loginModel.message ,
                  state: TostOptionState.ERROR
              );
            }
          }

        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: ReusPaddingSym(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusText(context, text: "Welcome Back !".toLowerCase(),
                      style:  Theme.of(context).textTheme.headline4,
                    ),
                    SizedBox(
                      height: 08.0,
                    ),
                    Text("Please sign in to continue",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Form(
                      key: formkey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ReusTextFormFilde(
                                controller: emailController,
                               // label: Text("email"),
                                label: Text("email",
                                  style:Theme.of(context).textTheme.caption,
                                ),
                                prefixIcon: Icon(Icons.email,color: defaultColors,),
                                labelStyle:Theme.of(context).textTheme.caption,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ) {
                                    return " enter you email";
                                  } else {
                                    return null;
                                  }
                                }),
                            SizedBox(
                              height: 15.0,
                            ),
                            ReusTextFormFilde(
                                controller: passwordController,
                                label: Text("password"),
                                prefixIcon: Icon(Icons.lock,color: defaultColors,),
                                labelStyle:Theme.of(context).textTheme.caption,
                                obscureText: ApploginCubit.get(context).isPassword,
                                iconsColor: Colors.teal,
                                presedIcon: () {
                                  ApploginCubit.get(context).changePasswordVisibility();
                                },
                                suffix: ApploginCubit.get(context).suffix,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return " enter your password";
                                  } else {
                                    return null;
                                  }
                                },
                              onTap: (){
                                if (formkey.currentState!.validate()) {
                                  ApploginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              }


                                ),

                            SizedBox(
                              height: 20.0,
                            ),

                            state is! ApploginLoadingState
                                ? ResuButton(
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        ApploginCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                                    childText: "Login",
                                  )
                                : Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.teal),),

                            SizedBox(
                              height: 15.0,
                            ),
                            ReusRowTextLink(
                                text: "You don\'t have an account?",
                                style: Theme.of(context).textTheme.caption,
                                textbtn: "Creat an Account",
                                onPressed: () {
                                  NavToAotherPage(context, RegisterScrenn());
                                })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
