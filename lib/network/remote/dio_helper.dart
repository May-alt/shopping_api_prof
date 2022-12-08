import 'package:dio/dio.dart';
import 'package:shopping_api_prof/models/user_models.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    String? token,

    Map<String, dynamic>? query,
    String lan = 'en'
  }) async{
    dio.options.headers = {
      'Content-Type': 'application/json',
      //Authorization : token != null? token,
      'lang':lan,
      'Authorization': token != null ? token:'',
    };
    return await dio.get(url);
  }




  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token != null ? token:'',
    };
    return dio.post(
        url,
        data: data
    );
  }



//   static Future<Response> saveData(){
//     return dio.
// }


}
