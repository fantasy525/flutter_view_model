import 'dart:async';

import 'package:flutter/material.dart';
import 'package:view_model/providers.dart';

import 'base/view_model.dart';

typedef Commit = void Function();


class TestState{
  int counter;
  TestState({this.counter});
}
enum TestEvent {
  add,
  down
}

class Test extends ViewModel<TestEvent,TestState>{
  @override
  // TODO: implement state
  TestState state = TestState(
    counter: 0
  );

  @override
  void mapEventToHandler( event, commit) {
    // TODO: implement mapEvent
    switch(event.event){
      case TestEvent.add:
        handleAdd(event.payload);
        commit();
        break;
      case TestEvent.down:
        handleDown(event.payload);
        commit();
        break;
    }
  }

  handleAdd(int n){
    state.counter = state.counter + n;
  }

  handleDown(int n){
    state.counter = state.counter - n;
  }











}