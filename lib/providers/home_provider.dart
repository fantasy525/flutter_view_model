// created by ZuoXiaoFei at 2019-09-05
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier{
  String _bossName;

  String get bossName => _bossName;

  String _address;

  String get address => _address;

  setName(String name){
    _bossName = name;
    notifyListeners();
  }

  setAddress(String address){
    _address = address;
    notifyListeners();
  }

}