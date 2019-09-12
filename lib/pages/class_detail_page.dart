// created by ZuoXiaoFei at 2019-09-05
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:should_rebuild/should_rebuild.dart';
import 'package:view_model/base/view_model.dart';
import 'package:view_model/view_models/class_detail_vm.dart';

import 'class_pass_list_page.dart';


class ClassDetailPage extends StatefulWidget {
  @override
  _ClassDetailPageState createState() => _ClassDetailPageState();
}

class _ClassDetailPageState extends State<ClassDetailPage> {
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child:Column(
            children: <Widget>[
              Consumer<ClassDetailVM>(
                builder: (_,vm,__) => Text("用户名${vm.userInfoVM.state.userName}"),
              ),
             _buildList()
            ],
          ),
        ),
      )
    );
  }

  _buildList(){
    return Consumer<ClassDetailVM>(
      builder: (_,vm,child){
        return Row(
          children: [

            InkResponse(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ClassPassList(flag: 1)
                ));
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.cyan,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("${vm.state.previewList["name"]}",style: TextStyle(color: Colors.white,fontSize: 40)),
                    Text("完成状态：${vm.state.previewList["finish"] == 1? '完成':'未完成'}",style: TextStyle(color: Colors.white,fontSize: 23))
                  ],
                ),
              ),
            ),
            InkResponse(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ClassPassList(flag: 2)
                ));
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.brown,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("${vm.state.reviewList["name"]}",style: TextStyle(color: Colors.white,fontSize: 40),),
                    Text("完成状态：${vm.state.reviewList["finish"] == 1? '完成':'未完成'}",style: TextStyle(color: Colors.white,fontSize: 23),)
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
