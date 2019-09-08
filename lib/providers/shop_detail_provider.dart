
import 'package:flutter/cupertino.dart';
import 'package:view_model/providers/home_view_model.dart';
import 'package:view_model/providers/shop_provider.dart';

class ShopDetailProvider with ChangeNotifier{
  int myAge = 0;
  final HomeViewModel shopProvider;
  ShopDetailProvider({this.shopProvider});
  setMyAge(){
    myAge++;
    notifyListeners();
  }

}