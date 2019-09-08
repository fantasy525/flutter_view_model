
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Event<E,P>{
  final E event;
  final P payload;
  Event({this.event,this.payload});
}

typedef Commit = void Function();

/// 所有view_model类的基类，通过[dispatch]一个[EnumEvent]事件来匹配到事件处理器
/// 处理完后再[ViewModel._commit]/commit来提交更改到UI层
/// 注意: view_model的实例只能通过dispatch事件触发UI层的更改，
/// 直接更改[state]不能触发UI更改，实例的方法无法直接调用
/// 好处:UI层和vm解耦，UI层没有硬编码调用vm的更改方法，
///
/// 建议 所有的ViewModel子类的实例方法都写为私有方法，不让UI层直接调用

abstract class ViewModel<EnumEvent,State> with ChangeNotifier{
  State state;

  /// 通知UI层的变化
  @protected
  void _commit(){
    super.notifyListeners();
  }

  @protected
  void mapEventToHandler(Event event,Commit commit);

  void dispatch(Event event){
    print('{event: ${event.event},payload:${event.payload}}');
    mapEventToHandler(event,_commit);
  }

  @protected
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    throw ErrorSummary('ViewModel 不能直接调用 notifyListeners,你应该通过dispatch event来触发更新');
  }

  @mustCallSuper
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
