// created by ZuoXiaoFei at 2019-09-05
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:view_model/Test.dart';

import 'base/view_model.dart';



void main(){
  Test test = Test();

  Timer(Duration(seconds: 3),(){
    test.dispatch(Event(event: TestEvent.add,payload: 4));
  });

  Timer(Duration(seconds: 6),(){
    test.dispatch(Event(event: TestEvent.down,payload: 3));
  });
  test.addListener((){
    print(test.state.counter);
  });
}

class A extends Test{
  hello(){
    notifyListeners();
  }
}

