// created by ZuoXiaoFei at 2019-09-05
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:should_rebuild/should_rebuild.dart';
import 'package:view_model/providers/home_provider.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                child: Center(
                  child: Text('首页'),
                ),
              ),
              Row(
                children: <Widget>[
                  Text('输入boss名字'),
                  Expanded(
                    child: Consumer<HomeProvider>(
                      builder: (context,homeProvider,child){
                        return TextField(
                          onChanged: homeProvider.setName,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)
                              )
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              Consumer<HomeProvider>(
                builder: (context,homeProvider,child){
                  return Text('boss的名字是${homeProvider.bossName}');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
