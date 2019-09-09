// created by ZuoXiaoFei at 2019-09-05
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:view_model/base/store.dart';
import 'package:view_model/base/view_model.dart';
import 'package:view_model/view_models/todo_view_model.dart';


class HomeState{
  String bossName;
  int age;
  HomeState({this.bossName,this.age});
}

enum HomeEvent{
  setBossName,
  setBossAge,
}

class HomeViewModel extends ViewModel<HomeEvent,HomeState>{
  final ToDoViewModel toDoViewModel;
  HomeViewModel({this.toDoViewModel});
  HomeState state = HomeState(bossName: '',age: 0);

  _setBossName(Event event,Commit commit,Completer completer){
    state.bossName = event.payload.getString("bossName");
    commit();
    completer.complete();
  }

  _setBossAge(Event event,Commit commit,Completer completer){
    state.age = event.payload.getInt("age");
    commit();
    completer.complete();
  }

  @override
  void mapEventToHandler(Event event, commit, [Completer completer]) {
    // TODO: implement mapEventToHandler
    switch(event.event){
      case HomeEvent.setBossName:
        _setBossName(event,commit,completer);
        break;
      case HomeEvent.setBossAge:
        _setBossAge(event,commit,completer);
        break;
    }
  }


}