import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:view_model/base/store.dart';
import 'package:view_model/pages/class_detail_page.dart';
import 'package:get_it/get_it.dart';
import 'package:view_model/pages/login_page.dart';
import 'package:view_model/view_models/class_detail_vm.dart';
import 'package:view_model/view_models/user_info_view_model.dart';
import 'base/view_model.dart';

void main(){

  final store = Store(
      viewModels: {
        ClassDetailVM: (inject) => ClassDetailVM(userInfoVM: inject<UserInfoVM>()),
        UserInfoVM: (_) => UserInfoVM()
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
        ChangeNotifierProvider.value(value: store.get<ClassDetailVM>()),
        ChangeNotifierProvider.value(value: store.get<UserInfoVM>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}


