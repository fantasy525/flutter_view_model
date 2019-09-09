import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:view_model/base/store.dart';
import 'package:view_model/pages/home_page.dart';
import 'package:get_it/get_it.dart';
import 'package:view_model/view_models/home_view_model.dart';
import 'base/view_model.dart';

void main(){

  final store = Store(
      viewModels: {
        HomeViewModel:(inject)=>HomeViewModel(),
      }
  );
  runApp(MyApp(store: store,));
}


class MyApp extends StatelessWidget {

  final Store store;
  MyApp({this.store});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return   MultiProvider(
      providers: [
       ChangeNotifierProvider(builder: (context) => store.get<HomeViewModel>(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}


