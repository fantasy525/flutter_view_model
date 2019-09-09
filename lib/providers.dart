// created by ZuoXiaoFei at 2019-09-05
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:view_model/Test.dart';

import 'base/view_model.dart';



void main(){
  GetIt getIt = GetIt.instance;
  getIt.registerFactory<A>((){
    return A(getIt.get<B>());
  });
  getIt.registerFactory<B>((){
    return B();
  });
  getIt.get<A>().b.name = 'woshi';
  print(getIt.get<A>().b.name);
}



class A {
  String name = 'A';
  B b;
  A(B b){
    this.b = b;
  }
}
class B {
  B(){
    print('BBB');
  }
  String name = 'B';
}

