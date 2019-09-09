
import 'package:view_model/base/view_model.dart';
/// view_model builder
typedef ViewModelBuilder = ViewModel Function(Inject inject);

/// 注入依赖的函数
typedef Inject =  T Function <T>();

class Store {
   Map<Type,_ViewModelFactory> _factories ={};
   Store({Map<Type,ViewModelBuilder> viewModels}){
     _init(viewModels);
   }

   _init(Map<Type,ViewModelBuilder> builders){
      builders.forEach((key,builder){
        _factories[key] = _ViewModelFactory(
            viewModelBuilder: builder,
            inject: this.get
        );
      });
   }
   /// 泛型 [T] 是必传 ，否则无法找到正确的view_model
   T get<T>(){
     _ViewModelFactory _viewModelFactory = _factories[T];
     if(_viewModelFactory != null){
       return _viewModelFactory.getViewModel<T>();
     }
     else{
       throw '未找到${T} ViewModel,你注册过它了吗？或者你给get方法传入泛型参数了吗？';
     }
   }
}

/// [_instance] 真正的view_model
/// [viewModelBuilder] view_model builder;
/// [inject] 可以获取view_model
class _ViewModelFactory{
  final ViewModelBuilder viewModelBuilder;
  final Inject inject;
  Object _instance;
  _ViewModelFactory({this.viewModelBuilder,this.inject});
  T getViewModel<T>(){
    if(_instance == null){
      _instance = viewModelBuilder(this.inject) as T;
    }
    return _instance;
  }
}





