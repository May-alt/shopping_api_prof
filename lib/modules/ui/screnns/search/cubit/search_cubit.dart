import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_api_prof/layout/constants/const_link_url.dart';
import 'package:shopping_api_prof/models/search_models.dart';
import 'package:shopping_api_prof/network/local/cache_helper.dart';
import 'package:shopping_api_prof/network/remote/dio_helper.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);


 SearchModel? searchModel ;


 void SearchData(String text){

   emit(SearchLoadingState());
   DioHelper.postData(
       token:Cachehelper.getData(key: 'token',),
       url: SEARCH_PROD,
       data: {
         'text' :text
       },

   ).then((value) {
     searchModel = SearchModel.fromJson(value.data);
     print(value.data.toString());
     emit(SearchSuccessState());
   }).
   catchError((onError){
     emit(SearchErrorState(onError.toString()));
   });
 }



}
