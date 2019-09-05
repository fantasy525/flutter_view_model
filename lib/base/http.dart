// created by ZuoXiaoFei at 2019-09-05
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Http{
  static const String BASE_URL = 'https://www.metaweather.com';
  static Dio _dio = Dio();
  static Future<Response<T>> get<T>(String url,Map params){
    return _dio.get<T>('$BASE_URL${url}',queryParameters: params);
  }
  static post(String url,Map data){
    return _dio.post('$BASE_URL/$url',data: data);
  }
}