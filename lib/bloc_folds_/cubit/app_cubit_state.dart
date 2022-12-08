part of 'app_cubit_cubit.dart';

@immutable
abstract class AppCubitState {}

class AppCubitInitial extends AppCubitState {}

//For Bottom Navigation b ar
class AppChangeBottomNavigationstate extends AppCubitState{}

//For Get Home Information
class AppLoadingHomeState extends AppCubitState{}
class AppSuccessHomeState extends AppCubitState{}
class AppErrorHomeState extends AppCubitState{
  final String Error;
   AppErrorHomeState({required this.Error});
}

//For Category
class AppLoadingCategoryState extends AppCubitState{}
class AppSuccessCategoryState extends AppCubitState{}
class AppErrorCategoryState extends AppCubitState{
  final String Error;
  AppErrorCategoryState(this.Error);
}

//For Get Favorites

class AppErrorGetFavoritesState extends AppCubitState{
  final String error;
  AppErrorGetFavoritesState(this.error);
}
class AppSuccessGetFavoritesState extends AppCubitState{
  final FavoritesModels? favoritesModels;
  AppSuccessGetFavoritesState(this.favoritesModels);
}
class AppLoadingGetFavoritesState extends AppCubitState{}





//For Change Favorites

class AppChangeFavoritesState extends AppCubitState{}

class AppSuccessChangeFavoritesState extends AppCubitState{
  final GetFavoritesModels getFavoritesModels;
  AppSuccessChangeFavoritesState(this.getFavoritesModels);
}
class AppErrorChangeFavoritesState extends AppCubitState{
  final String error;
  AppErrorChangeFavoritesState(this.error);
}

//For Mode Of App

class AppChangeModeTheme extends AppCubitState{}




















