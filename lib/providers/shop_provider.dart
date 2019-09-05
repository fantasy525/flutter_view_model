// created by ZuoXiaoFei at 2019-09-05
import 'package:flutter/material.dart';
import 'package:view_model/models/product_list_model.dart';
import 'package:view_model/services/api.dart';

class ShopProvider with ChangeNotifier{
  ProductListModel _productListModel;

  ProductListModel get productListModel => _productListModel;

  setProductList(){
    Api.getProductList().then((res){
      if(res.statusCode == 200){
        _productListModel = ProductListModel.fromJson(res.data.list);
      }
    });
    notifyListeners();
  }
}