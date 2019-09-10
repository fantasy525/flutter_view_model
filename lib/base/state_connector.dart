// created by ZuoXiaoFei at 2019-09-10
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateConnector<VM,S> extends StatefulWidget {
  final Widget Function(BuildContext context,S value) builder;
  final S Function(VM vm) connector;

  StateConnector({@required this.connector, @required this.builder}):assert(connector != null && builder != null);
  @override
  _StateConnectorState createState() => _StateConnectorState<VM,S>();
}

class _StateConnectorState<VM,S> extends State<StateConnector<VM,S>> {
  S value;
  Widget cache;
  @override
  // TODO: implement widget
  @override
  Widget build(BuildContext context) {
    VM vm = Provider.of<VM>(context);
    S newValue = widget.connector(vm);
    if(cache == null  || newValue != value){
      value = newValue;
      cache = widget.builder(context,widget.connector(vm));
    }
    return cache;
  }
}

