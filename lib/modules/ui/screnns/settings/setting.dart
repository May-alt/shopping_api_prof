import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_api_prof/bloc_folds_/cubit/app_cubit_cubit.dart';
import 'package:shopping_api_prof/layout/reusibale_widgets/reus_app_widgets.dart';
import 'package:shopping_api_prof/modules/ui/screnns/authentification/login/login.dart';
import 'package:shopping_api_prof/network/local/cache_helper.dart';


class SettingScrenns extends StatefulWidget {
  const SettingScrenns({Key? key}) : super(key: key);

  @override
  State<SettingScrenns> createState() => _SettingScrennsState();
}

class _SettingScrennsState extends State<SettingScrenns> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubitCubit,AppCubitState>(

      listener: (context, state) {},
        builder: (context, state) {
        AppCubitCubit cubit = AppCubitCubit.get(context);

          return Scaffold(
            body: SingleChildScrollView(
              child:ReusPaddingAll(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ReusCardListTile(
                      onTap: (){
                        Cachehelper.removeData(key: 'token').then((value) {
                          NavToAndRemove(context, LoginScrenn());
                        });
                      },
                        text: "Log Out",
                        style: Theme.of(context).textTheme.caption,
                        icon: Icons.logout
                    ),

                    SizedBox(height: 10.0,),

                    ReusCardListTile(
                       text: AppCubitCubit.get(context).isDark ? "light Mode": " Dark Mode",
                      // text: "light Mode",
                        style: Theme.of(context).textTheme.caption,

                        onTap: (){
                         AppCubitCubit.get(context).changeAppTheme();
                        },
                         icon: AppCubitCubit.get(context).isDark ? Icons.light_mode :Icons.dark_mode ,
                      // icon: Icons.light_mode
                    ),
                  ],
                ),
              ),
            ),
          );
        },
    );
  }
}
