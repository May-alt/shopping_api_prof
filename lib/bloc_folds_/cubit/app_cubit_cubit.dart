import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_api_prof/layout/constants/const_link_url.dart';
import 'package:shopping_api_prof/models/categories_models.dart';
import 'package:shopping_api_prof/models/favorites_models.dart';
import 'package:shopping_api_prof/models/get_favorites_models.dart';
import 'package:shopping_api_prof/models/home_models.dart';
import 'package:shopping_api_prof/models/user_models.dart';
import 'package:shopping_api_prof/modules/ui/screnns/category/category.dart';
import 'package:shopping_api_prof/modules/ui/screnns/favorite/favorite_screnns.dart';
import 'package:shopping_api_prof/modules/ui/screnns/home/home.dart';
import 'package:shopping_api_prof/modules/ui/screnns/profile/profile.dart';
import 'package:shopping_api_prof/modules/ui/screnns/settings/setting.dart';
import 'package:shopping_api_prof/network/local/cache_helper.dart';
import 'package:shopping_api_prof/network/remote/dio_helper.dart';

part 'app_cubit_state.dart';

class AppCubitCubit extends Cubit<AppCubitState> {
  AppCubitCubit() : super(AppCubitInitial());


  static AppCubitCubit get(context) => BlocProvider.of(context);

  /************************ For bottom navigation bar*********************************/
  int currentIndex = 0;

  List<Widget> Screnns = [
    const HomeScrenns(),
    const CategoryScrenns(),
    const FavoritScrenns(),
    //const ProfilScrenns(),
    const SettingScrenns(),
  ];

 void changeScreenIndex(int index){
   currentIndex = index;
   emit(AppChangeBottomNavigationstate());
 }
  /************************ For Mode Of App*********************************/


 var isDark = false;

 void changeAppTheme({bool? fromSahredDark}){
   if(fromSahredDark != null){
     isDark = fromSahredDark;
     emit(AppChangeModeTheme());
   }
   else{
     isDark =! isDark;
     Cachehelper.saveData(key: 'isDark', value: isDark).then((value){
       emit(AppChangeModeTheme());
     });


   }
 }




  /************************ Methods get Home data products and banners *********************************/
 HomeModel? homeModel ;

 Map<int?, bool?> changeFavorites ={};

 void getHomeData(){
   
   emit(AppLoadingHomeState());
   DioHelper.getData(
       url: HOME,
       token: Cachehelper.getData(key: 'token'),
      ).then((value) {
        homeModel = HomeModel.fromJson(value.data);
        // print(homeModel.status);
        // print(homeModel.data.banners[0].image);
        // print(homeModel.data.products[1].id);

        //remplire Favorite
        homeModel!.data.products.forEach((element) {
          changeFavorites.addAll({
            element.id! :element.inFavorites!
          });
        });
      //{52: false, 55: false, 53: false, 54: false, 56: false, 57: false, 58: false, 80: false, 82: false, 84: false, 85: false, 81: false, 86: false, 83: false, 87: false, 89: false, 88: false, 92: false, 90: false, 91: false}
        print(changeFavorites.toString());

       emit(AppSuccessHomeState());
   }).catchError((onError){
     print(onError.toString());
     emit(AppErrorHomeState(Error: onError.toString()));
   });
 }

  /************************ Methods get categories *********************************/
 late CategoriesModels categoriesModels;

 void getCategoriesData(){
   DioHelper.getData(
       url: CATEGORIES,
     token: Cachehelper.getData(key: 'token'),
   ).then((value) {
     categoriesModels = CategoriesModels.fromJson(value.data);
    // print(categoriesModels.data.datalist[0].image);
     emit(AppSuccessCategoryState());
   }).catchError((onError){
    // print(onError.toString());
     emit(AppErrorCategoryState(onError));
   });
 }
  /************************ Methods get Favorites *********************************/
  
 FavoritesModels? favoritesModels;

  void getFavorites(){
    emit(AppLoadingGetFavoritesState());
    DioHelper.getData(

      url: FAVORITES,
      token: Cachehelper.getData(key: 'token'),

    ).then((value){
      favoritesModels = FavoritesModels.fromJson(value.data);
      print("get favorites");
      print(value.data.toString());
      print("get favorites");

      emit(AppSuccessGetFavoritesState(favoritesModels!));

    }).catchError((onError){

      print(onError.toString());

      emit(AppErrorGetFavoritesState(onError.toString()));
    });
  }

/************************ Methods get Change Fovorites Favorites *********************************/

 late GetFavoritesModels getFavoritesModels ;

  void postChangeFav(int product_id){
     changeFavorites[product_id];

    DioHelper.postData(
        url: FAVORITES,
       token: Cachehelper.getData(key: 'token'),
      data: {
          'product_id' :product_id,
      }
    ).then((value) {
      getFavoritesModels = GetFavoritesModels.fromJson(value.data);
      print(value.data.toString());
      emit(AppSuccessChangeFavoritesState(getFavoritesModels));

    }).catchError((error){
      emit(AppErrorChangeFavoritesState(error.toString()));
    });
  }








 // late LoginModel userInfoModel ;
 //
 // void getUserInfo(){
 //   emit(AppLoadingUserInformationState());
 //   DioHelper.getData(
 //       url: PROFILE,
 //       token:  Cachehelper.getData(key: 'token')
 //   ).then((value)
 //   {
 //     userInfoModel = LoginModel.fromJson(value.data);
 //
 //     emit(AppSuccessUserInformationState(userInfoModel));
 //   }
 //   ).catchError((onError){
 //     print(onError.toString());
 //    emit(AppErrorUserInformationState(onError));
 //   });
 // }

}
