// created by ZuoXiaoFei at 2019-09-05
import 'package:flutter/material.dart';
import 'package:view_model/base/store.dart';
import 'package:view_model/base/view_model.dart';
import 'package:view_model/providers/todo_view_model.dart';

class HomeState{
  String bossName;
  int age;
  HomeState({this.bossName,this.age});
}

enum HomeEvent{
  setBossName,
  setBossAge
}

class HomeViewModel extends ViewModel<HomeEvent,HomeState>{
  HomeState state = HomeState(bossName: '',age: 0);

  @override
  void mapEventToHandler(Event event, commit) {
    // TODO: implement mapEvent
    switch(event.event){
      case HomeEvent.setBossName:
        setBossName(event.payload,commit);
        break;
      case HomeEvent.setBossAge:
        setBossAge(event.payload, commit);
        break;
    }
  }

  setBossName(String bossName,Commit commit){
    state.bossName = bossName;
    commit();
  }

  setBossAge(String age,Commit commit){
    state.age = int.parse(age);
    commit();
  }

}