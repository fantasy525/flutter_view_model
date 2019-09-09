// created by ZuoXiaoFei at 2019-09-05
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:should_rebuild/should_rebuild.dart';
import 'package:view_model/base/view_model.dart';
import 'package:view_model/pages/shop_detail_list.dart';
import 'package:view_model/view_models/home_view_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child:Column(
            children: <Widget>[
              Consumer<HomeViewModel>(
                builder: (context,hv,_){
                  return Text(hv.state.age.toString());
                },
              ),
              RaisedButton(
                child: Icon(Icons.add),
                onPressed: (){
                  Provider.of<HomeViewModel>(context,listen: false)
                      .dispatch(Event(
                      event: HomeEvent.setBossAge,
                      payload: PayLoad()..putInt("age", ++counter)));
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopDetailPage()));
        },
      ),
    );
  }
}
