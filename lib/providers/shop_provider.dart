// created by ZuoXiaoFei at 2019-09-05
import 'package:flutter/material.dart';
import 'package:view_model/models/product_list_model.dart';
import 'package:view_model/providers/shop_detail_provider.dart';
import 'package:view_model/services/api.dart';

class ShopProvider with ChangeNotifier{
  final ShopDetailProvider shopDetailProvider;
  ShopProvider({this.shopDetailProvider});
  ProductListModel _productListModel;

  int counter = 0;

  ProductListModel get productListModel => _productListModel;

  setProductList(){
    counter ++;
    notifyListeners();
  }
}