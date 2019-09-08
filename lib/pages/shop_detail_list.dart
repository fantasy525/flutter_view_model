// created by ZuoXiaoFei at 2019-09-05
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:view_model/providers/shop_detail_provider.dart';
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
             Consumer<ShopDetailProvider>(
                builder: (context,shopDetailProvider,child){
                  return Row(
                    children: <Widget>[
                      Text(shopDetailProvider.myAge.toString()),
                      Text(shopDetailProvider.shopProvider.state.age.toString())
                    ],
                  );
                },
             ),
             Consumer<ShopDetailProvider>(
               builder: (context,shopDetailProvider,child){
                 return RaisedButton(
                   child: Icon(Icons.add),
                   onPressed: (){
                      shopDetailProvider.setMyAge();
                   },
                 );
               },
             ),
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
