import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_api_prof/layout/constants/const_colors.dart';
import 'package:shopping_api_prof/layout/reusibale_widgets/const_widgets.dart';
import 'package:shopping_api_prof/layout/reusibale_widgets/reus_app_widgets.dart';
import 'package:shopping_api_prof/modules/ui/navigation/layouts_screnns.dart';
import 'package:shopping_api_prof/modules/ui/screnns/authentification/login/login.dart';
import 'package:shopping_api_prof/modules/ui/screnns/authentification/register/cubit/register_cubit.dart';
import 'package:shopping_api_prof/network/local/cache_helper.dart';

class RegisterScrenn extends StatefulWidget {
  const RegisterScrenn({Key? key}) : super(key: key);

  @override
  State<RegisterScrenn> createState() => _RegisterScrennState();
}

class _RegisterScrennState extends State<RegisterScrenn> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  // var obscureText = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterState>(
        listener: (context, state) {

          if(state is RegisterSuccessState){

            if(state.loginModel.status){
              Cachehelper.saveData(
                  key: "token",
                  value: state.loginModel.data!.token
              ).then((value) {
                tostShow(msg: state.loginModel.message, state: TostOptionState.SUCCESS);
                NavToAndRemove(context, LayoutsScrenns());

              });

            }

            else{
              tostShow(msg: state.loginModel.message, state: TostOptionState.ERROR);
            }

          }

        },

        builder: (context, state) {

          RegisterCubit cubit = RegisterCubit.get(context);

          return Scaffold(
            body: SingleChildScrollView(
              child: ReusPaddingSym(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusText(context, text: "Create Account",
                    style:Theme.of(context).textTheme.headline4
                    ),
                    SizedBox(
                      height: 08.0,
                    ),
                    Text("Please sign up to continue",
                    style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Form(
                      key: formkey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            ReusTextFormFilde(
                                controller: nameController,
                                label: Text("name"),
                                prefixIcon: Icon(Icons.person,color: defaultColors,),
                                labelStyle:Theme.of(context).textTheme.caption,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return " enter you name";
                                  } else {
                                    return null;
                                  }
                                }),

                            SizedBox(
                              height: 15.0,
                            ),

                            ReusTextFormFilde(
                                controller: phoneController,
                                label: Text("phone"),
                                prefixIcon: Icon(Icons.phone,color: defaultColors,),
                                labelStyle:Theme.of(context).textTheme.caption,
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return " enter you phone";
                                  } else {
                                    return null;
                                  }
                                }),

                            SizedBox(
                              height: 15.0,
                            ),

                            ReusTextFormFilde(
                                controller: emailController,
                                label: Text("email"),
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
                                obscureText: cubit.isPassword,
                                iconsColor: Colors.teal,
                                presedIcon: () {
                                  cubit.changeVisibiltyIconsPassword();
                                },
                                suffix: cubit.suffix,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return " enter your password";
                                  } else {
                                    return null;
                                  }
                                }),

                            SizedBox(
                              height: 20.0,
                            ),

                            state is! RegisterLoadingState
                                ? ResuButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  RegisterCubit.get(context).UserReigter(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              childText: "Register".toUpperCase(),
                            )
                                : Center(
                              child: CircularProgressIndicator(
                                  color: Colors.teal,
                              ),
                            ),


                            SizedBox(
                              height: 15.0,
                            ),

                            ReusRowTextLink(
                                text: "you have an account?",
                                style: Theme.of(context).textTheme.caption,
                                textbtn: "Login Know",
                                onPressed: () {
                                  NavToAotherPage(context, LoginScrenn());
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
