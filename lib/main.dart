import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:view_model/base/store.dart';
import 'package:view_model/pages/class_detail.dart';
import 'package:get_it/get_it.dart';
import 'package:view_model/view_models/class_detail_vm.dart';
import 'base/view_model.dart';

void main(){

  final store = Store(
      viewModels: {
        ClassDetailVM: (_) => ClassDetailVM()
      }
  );
  runApp(MyApp(store: store));
}


class MyApp extends StatelessWidget {

  final Store store;
  MyApp({this.store});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: store.get<ClassDetailVM>())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ClassDetailPage(),
      ),
    );
  }
}


