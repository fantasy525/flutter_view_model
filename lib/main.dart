import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:view_model/base/store.dart';
import 'package:view_model/pages/home_page.dart';
import 'package:view_model/providers/home_view_model.dart';
import 'package:view_model/providers/shop_detail_provider.dart';
import 'package:view_model/providers/shop_provider.dart';
import 'package:view_model/providers/todo_view_model.dart';

import 'base/view_model.dart';

void main(){


  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    Store store = Store(
//      builders: {
//        HomeViewModel:(inject) => HomeViewModel(
//          toDoViewModel:  inject.getViewModel(_viewModelFactory)<ToDoViewModel>()
//        )
//      }
//    );
    return   MultiProvider(
      providers: [

        ChangeNotifierProvider<HomeViewModel>(
          builder: (context) => HomeViewModel(),
        ),
        ChangeNotifierProxyProvider<HomeViewModel,ShopDetailProvider>(
          builder: (context,homeViewModel,_) => ShopDetailProvider(shopProvider: homeViewModel),
        ),
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


