// created by ZuoXiaoFei at 2019-09-05
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ShopDetailPage extends StatefulWidget {
  @override
  _ShopDetailPageState createState() => _ShopDetailPageState();
}

class _ShopDetailPageState extends State<ShopDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
           children: <Widget>[

             RaisedButton(
               child: Icon(Icons.backspace),
               onPressed: (){
                 Navigator.pop(context);
               },
             )
           ],
          ),
        ),
      ),
    );
  }
}
