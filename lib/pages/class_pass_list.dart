// created by ZuoXiaoFei at 2019-09-05
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:should_rebuild/should_rebuild.dart';
import 'package:view_model/base/state_connector.dart';
import 'package:view_model/base/view_model.dart';
import 'package:view_model/view_models/class_detail_vm.dart';

class ClassPassList extends StatelessWidget {
  final int flag;
  ClassPassList({this.flag});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Center(
                child:  Text("关卡列表"),
              ),
              Expanded(
                child: Consumer<ClassDetailVM>(
                  builder: (_,vm,__){
                    final List list = flag == 1? vm.state.previewList["passList"] : vm.state.reviewList["passList"];
                    return Row(
                        children: [
                          Expanded(
                            child: Consumer<ClassDetailVM>(
                              builder: (_,vm,__){
                                return Container(
                                  color:Colors.brown,
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      ShouldRebuild<Text>(
                                        child:  Text(list[0]["name"]),
                                        shouldRebuild: (o,n) => o.data != n.data,
                                      ),
                                      Selector<ClassDetailVM,int>(
                                          builder: (context,finish,_){
                                            return Text('${ finish == 1 ?'完成':'未完成'}');
                                          },
                                        selector: (_,vm) => flag == 1 ? vm.state.previewList["passList"][0]["finish"]:vm.state.reviewList["passList"][0]["finish"],
                                      ),
                                      RaisedButton(
                                        child: Text("yes"),
                                        onPressed: (){
                                          vm.dispatch(Event(
                                              event: ClassDetailEvent.setFinishCurrentPass,
                                              payload: PayLoad()..putInt("flag", flag)..putInt("passIndex", 0)
                                          ));
                                        },
                                      ),
                                      RaisedButton(
                                        child: Text("no"),
                                        onPressed: (){
                                          vm.dispatch(Event(
                                              event: ClassDetailEvent.setUnFinishCurrentPass,
                                              payload: PayLoad()..putInt("flag", flag)..putInt("passIndex", 0)
                                          ));
                                        },
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: Consumer<ClassDetailVM>(
                              builder: (_,vm,__){
                                return Container(
                                  color:Colors.brown,
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      ShouldRebuild<Text>(
                                        child:  Text(list[1]["name"]),
                                        shouldRebuild: (o,n) => o.data != n.data,
                                      ),
                                      StateConnector<ClassDetailVM,int>(
                                        connector: (vm) => (flag == 1 ? vm.state.previewList["passList"]:vm.state.reviewList["passList"])[1]["finish"] as int,
                                        builder: (context,value){
                                          return  Text('${value == 1 ?'完成':'未完成'}');
                                        },
                                      ),
                                      ShouldRebuild<RaisedButton>(
                                        child: RaisedButton(
                                          child: Text("yes"),
                                          onPressed: (){
                                            vm.dispatch(Event(
                                                event: ClassDetailEvent.setFinishCurrentPass,
                                                payload: PayLoad()..putInt("flag", flag)..putInt("passIndex", 1)
                                            ));
                                          },
                                        ),
                                        shouldRebuild: (o,n) => o.runtimeType != n.runtimeType
                                      ),
                                      ShouldRebuild<RaisedButton>(
                                        shouldRebuild: (o,n) => o.runtimeType != n.runtimeType,
                                        child: RaisedButton(
                                          child: Text("no"),
                                          onPressed: (){
                                            vm.dispatch(Event(
                                                event: ClassDetailEvent.setUnFinishCurrentPass,
                                                payload: PayLoad()..putInt("flag", flag)..putInt("passIndex", 1)
                                            ));
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ]
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

