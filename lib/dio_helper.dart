
// ignore_for_file: unused_import

import 'dart:io';

import 'package:dio/dio.dart';
class DioHelper{
  static late Dio dio ;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl:'http://38.105.232.194/aloha-api/api',
        receiveDataWhenStatusError: true,

      ),
    );
  }
  static Future<Response> getData({
  required String url,
    Map<String , dynamic>? query,
    String lang='en',
    String? token,
})async
  {
    dio.options.headers= {
      'lang':lang,
      'Accept':'application/json',
      'Authorization':'Bearer $token',
    };
    return await dio.get(url,queryParameters: query);
  }


  static Future<Response> postData({
    required String url,
     String? token,
     Map<String , dynamic>? query,
    required Map<String , dynamic> data,

  })async
  {
    dio.options.headers= {
      'Accept':'application/json',
       'Authorization': 'Bearer $token'

  };
     return dio.post(url,data: data,queryParameters: query);
  }



}

