import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

typedef Commit = Completer Function([bool notify]);

typedef OnSuccess = void Function();
typedef OnError = void Function();

///[event] 枚举类型
///[payload] 类比安卓中的Bundle概念
class Event {
  final dynamic event;
  final PayLoad payload;
  Event({this.event, this.payload});
}

///方便在派发事件时增加payload,这样在获取时可以有明确的类型提示
class PayLoad {
  Map<String, dynamic> _map = {};

  _setValue(var k, var v) => _map[k] = v;

  _getValue(String k) {
    if(!_map.containsKey(k)){
      throw Exception("你使用$k在payload不存在，请检查你的key名字是否正确，或者确定key是否存在payload");
    }
    return _map[k];
  }

  putInt(String k, int v) => _map[k] = v;

  putString(String k, String v) => _setValue(k, v);

  putBool(String k, bool v) => _setValue(k, v);

  putList<V>(String k, List<V> v) => _setValue(k, v);

  putMap<K, V>(String k, Map<K, V> v) => _setValue(k, v);

  int getInt(String k) => _getValue(k) as int;

  String getString(String k) => _getValue(k) as String;

  bool getBool(String k) => _getValue(k) as bool;

  List getList(String k) => _getValue(k) as List;

  Map getMap(String k) => _getValue(k) as Map;

  @override
  String toString() {
    // TODO: implement toString
    return _map.toString();
  }
}

/// 所有view_model类的基类，通过[dispatch]一个[EnumEvent]事件来匹配到事件处理器
/// 处理完后再[ViewModel._commit]/commit来提交更改到UI层
/// 注意: view_model的实例只能通过dispatch事件触发UI层的更改，
/// 直接更改[state]不能触发UI更改，实例的方法无法直接调用
/// 好处:UI层和vm解耦，UI层没有硬编码调用vm的更改方法，
///
/// 建议 所有的ViewModel子类的实例方法都写为私有方法，不让UI层直接调用

abstract class ViewModel<EnumEvent, State> with ChangeNotifier {
  State state;
  /// event映射，从event映射到不同的事件handler去处理
  @protected
  void mapEventToHandler(Event event, Commit commit);

  /// 通知UI层的变化
  @protected
  void _commit([bool notify = true]) {
    if(notify) super.notifyListeners();
  }

  /// UI层暴露的方法，通过此方法派发事件
  Future<R> dispatch<R>(Event event) {
    Completer<R> _completer = Completer();
    print('{event: ${event.event}, payload: ${event.payload}}');
    mapEventToHandler(event, ([notify = true]){
      this._commit(notify);
      return _completer;
    });
    return _completer.future;
  }

  /// 重写此方法，防止在UI层直接调用这个方法
  @protected
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    throw ErrorSummary(
        'ViewModel 不能直接调用 notifyListeners,你应该通过dispatch event来触发更新');
  }

  @mustCallSuper
  @override
  void dispose() {
    // TODO: implement dispose
    state = null;
    super.dispose();
  }
}