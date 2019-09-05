// created by ZuoXiaoFei at 2019-09-05
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:view_model/base/http.dart';
import 'package:view_model/models/product_list_model.dart';


class Api{
  static Future<Response<ProductListModel>> getProductList(){
    return new Dio().get('https://www.easy-mock.com/mock/5c7f3f49a243bb385e81f535/example/productList');
  }
}