// created by ZuoXiaoFei at 2019-09-09
import 'package:flutter/material.dart';
import 'package:view_model/base/view_model.dart';

class ShopDetailState{
  String name;
  int id;
  String content;
  ShopDetailState({this.name,this.id,this.content});
}

enum ShopDetailEvent{
  setContent
}

class ShopDetailViewModel extends ViewModel<ShopDetailEvent,ShopDetailState>{

  ShopDetailState state = ShopDetailState();

  @override
  void mapEventToHandler(Event event, commit) {
    // TODO: implement mapEventToHandler
    switch(event.event){
      case ShopDetailEvent.setContent:
        setContent();
        commit();
        break;
    }
  }

  setContent(){

  }

}