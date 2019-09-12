// created by ZuoXiaoFei at 2019-09-11
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:view_model/base/state_connector.dart';
import 'package:view_model/base/view_model.dart';
import 'package:view_model/pages/class_detail_page.dart';
import 'package:view_model/view_models/user_info_view_model.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("用户名"),
                  Consumer<UserInfoVM>(
                    builder: (_,vm,__){
                      return  Text("${vm.state.userName}");
                    },
                  ),
                  Consumer<UserInfoVM>(
                    builder: (_,vm,__){
                      return  Text("${vm.state.age}");
                    },
                  ),
                  StateConnector<UserInfoVM,int>(
                    connector: (vm) => vm.state.age,
                    builder: (context,age) {
                      return Row(
                        children: <Widget>[
                          Text("$age"),
                          Text("$age"),Text("$age"),
                          Text("$age")
                        ],
                      );
                    },
                  )
                ],
              ),
              Consumer<UserInfoVM>(
                builder: (context,vm,_){
                  return RaisedButton(
                    child: Icon(Icons.local_grocery_store),
                    onPressed: (){
                      vm.dispatch(Event(
                          event: UserInfoEvent.setUserName,
                          payload: PayLoad()..putString("userName", "jay")
                      )).then((_){

                       Navigator.push(context, MaterialPageRoute(builder: (context)=> ClassDetailPage()));
                      }).catchError((_){
                        print(_);
                      });
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
