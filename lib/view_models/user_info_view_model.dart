// created by ZuoXiaoFei at 2019-09-11
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:view_model/base/view_model.dart';

class UserInfoState{
  String userName = 'default';
  int age = 0;
}

enum UserInfoEvent{
  setUserName,
  getUserName
}

class UserInfoVM extends ViewModel<UserInfoEvent,UserInfoState>{
  final state = UserInfoState();
  @override
  void mapEventToHandler(Event event, commit) {
    switch (event.event){
      case UserInfoEvent.setUserName:
        _setUserName(event.payload, commit);
        break;
      case UserInfoEvent.getUserName:
        _setUserName(event.payload, commit);
        break;
    }
  }
  _setUserName(PayLoad payLoad,Commit commit){
    state.userName = payLoad.getString("userName");
  }
  _getUserName(PayLoad payLoad,Commit commit){
    state.userName = payLoad.getString("userName");
  }




}