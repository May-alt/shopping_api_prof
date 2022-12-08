// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopping_api_prof/bloc_folds_/cubit/app_cubit_cubit.dart';
// import 'package:shopping_api_prof/layout/reusibale_widgets/reus_app_widgets.dart';
// import 'package:shopping_api_prof/modules/ui/screnns/authentification/login/cubit/applogin_cubit.dart';
// import 'package:shopping_api_prof/modules/ui/screnns/authentification/register/cubit/register_cubit.dart';
//
// class ProfilScrenns extends StatefulWidget {
//   const ProfilScrenns({Key? key}) : super(key: key);
//
//   @override
//   State<ProfilScrenns> createState() => _ProfilScrennsState();
// }
//
// class _ProfilScrennsState extends State<ProfilScrenns> {
//   @override
//   Widget build(BuildContext context) {
//      return BlocConsumer<AppCubitCubit,AppCubitState>(
//        listener: (context, state) {},
//          builder: (context, state) {
//
//          AppCubitCubit cubit = AppCubitCubit.get(context);
//
//            return  state is !AppLoadingUserInformationState
//                ? Scaffold(
//            body: SingleChildScrollView(
//              child: ReusPaddingAll(
//                child: Column(
//                  children: [
//                    Container(
//                      height: 150,
//                      color: Colors.grey,
//                    ),
//                    SizedBox(height: 20.0,),
//
//                    ReusCardListTile(
//                        text:"cubit.userInfoModel.data!.name",
//                        onPressedBtn: (){
//
//                        },
//                        icon: Icons.person
//                    )
//                  ],
//                ),
//              ),
//            ),
//          ): Center(child: CircularProgressIndicator(),);
//          },
//      );
//   }
// }
