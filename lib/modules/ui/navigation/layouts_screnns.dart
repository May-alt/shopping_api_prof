import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_api_prof/bloc_folds_/cubit/app_cubit_cubit.dart';
import 'package:shopping_api_prof/layout/reusibale_widgets/reus_app_widgets.dart';
import 'package:shopping_api_prof/modules/ui/screnns/authentification/login/login.dart';
import 'package:shopping_api_prof/modules/ui/screnns/search/search.dart';
import 'package:shopping_api_prof/network/local/cache_helper.dart';


class LayoutsScrenns extends StatefulWidget {
  const LayoutsScrenns({Key? key}) : super(key: key);

  @override
  State<LayoutsScrenns> createState() => _LayoutsScrennsState();
}

class _LayoutsScrennsState extends State<LayoutsScrenns> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubitCubit,AppCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubitCubit.get(context);
        return Scaffold(

          appBar: AppBar(
            title: Text("Shopping-App",),
            actions: [
              IconButton(
                onPressed: (){
                  NavToAotherPage(context, SearchScrenns());
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),

          body: cubit.Screnns[cubit.currentIndex],

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeScreenIndex(index);
            },
            items: [
              BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon:Icon(Icons.category),label: "Category"),
              // BottomNavigationBarItem(icon:Icon(Icons.person),label: "profile"),
              BottomNavigationBarItem(icon:Icon(Icons.favorite),label: "Favorite"),
              BottomNavigationBarItem(icon:Icon(Icons.settings),label: "Setting"),
            ],
          ),


        );
      },

    );
  }
}
