import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_api_prof/bloc_folds_/cubit/app_cubit_cubit.dart';
import 'package:shopping_api_prof/layout/constants/const_link_url.dart';
import 'package:shopping_api_prof/layout/constants/theme_const.dart';
import 'package:shopping_api_prof/modules/ui/navigation/layouts_screnns.dart';
import 'package:shopping_api_prof/modules/ui/on_bording/on_bordon_screnns.dart';
import 'package:shopping_api_prof/modules/ui/screnns/authentification/login/login.dart';
import 'package:shopping_api_prof/network/local/cache_helper.dart';
import 'package:shopping_api_prof/network/remote/dio_helper.dart';



import 'package:shopping_api_prof/layout/constants/const_link_url.dart';



void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await Cachehelper.init();

  //Meme pour Theme Mode
  bool? onBording = Cachehelper.getData(key: 'onBording');
  String? token = Cachehelper.getData(key: 'token');

  bool? isDark = Cachehelper.getData(key: 'isDark');

  print("theme situation is" );
  print(isDark.toString());

  Widget widgets;

  if(onBording != null){
      if(token != null){widgets =LayoutsScrenns();}
      else{widgets = LoginScrenn();}
    }
  else{
      widgets = OnBordingScrenn();
    }

  print("OnBording situation is" );
  print(onBording.toString() );

  print("Token is :" );
  print(token.toString() );

  runApp(
      MyApp(
          startWidgets: widgets,
          isDark: isDark,
      ),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidgets;
  final bool? isDark;

  MyApp({super.key,required this.startWidgets,this.isDark});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          //create: (context) => AppCubitCubit()..getHomeData()..getCategoriesData()..getUserInfo(),
          create: (context) => AppCubitCubit()..getHomeData()..getCategoriesData()..getFavorites()..changeAppTheme(fromSahredDark: isDark),
        ),
      ],

      child: BlocConsumer<AppCubitCubit,AppCubitState>(
        listener: (context, state) {},
        builder: (context, state) {

          return MaterialApp(
            title: 'Flutter Demo',
            theme: ligthTheme,
            darkTheme: darkTheme,
            themeMode: AppCubitCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            //si on bording fase Go to On bording sinon Go to Login sinon Personne Gonnected And token saved Go to lyout Screnns
            // home: onBording ?  LoginScrenn() : OnBordingScrenn(),
            home: startWidgets,
          );

        },
      ),
    );
  }
}

