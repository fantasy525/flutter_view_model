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












