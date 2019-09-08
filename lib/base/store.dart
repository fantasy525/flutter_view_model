
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:view_model/base/view_model.dart';
import 'package:view_model/providers/home_view_model.dart';

typedef ViewModelBuilder = ViewModel Function(Store store);

typedef GetViewModel =  T Function <T>();
typedef FactoryFunc<T> = T Function();

class Inject{

}

class _ViewModelFactory<T>{
  final ViewModelBuilder viewModelBuilder;
  Object _instance;
  _ViewModelFactory({this.viewModelBuilder});
  T getViewModel(_ViewModelFactory _viewModelFactory,Store store){
    if(_instance == null){
      _instance = viewModelBuilder(store) as T;
    }
    return _instance;
  }
}

class Store with ChangeNotifier{
   Map<Type,_ViewModelFactory> _factories;
   Map<Type,ViewModel> _viewModels;

   Store({Map<Type,ViewModelBuilder> viewModels}){
     _init(viewModels);
   }
    _init(Map<Type,ViewModelBuilder> builders){
      builders.forEach((key,builder){
        _factories[key] = _ViewModelFactory(
            viewModelBuilder: builder
        );
      });
   }
//   get<T>(){
//     _ViewModelFactory _viewModelFactory = Provider.of<Store>(context).viewModels[T];
//     if(_viewModelFactory != null){
//       return _viewModelFactory.getViewModel(this);
//     }
//     else
//       return null;
//
//   }

//   static T of<T>(context){
//      return
//   }
}

class StoreProvider extends StatefulWidget {
  final Map<Type,_ViewModelFactory> factories;
  final Map<Type,ViewModel> viewModels;
  StoreProvider({
    this.factories,
    this.viewModels
});
  @override
  _StoreProviderState createState() => _StoreProviderState();
}

class _StoreProviderState extends State<StoreProvider> {


  @override
  Widget build(BuildContext context) {
    return _InheritedProvider(

    );
  }
}

class _InheritedProvider extends InheritedWidget{
  final dynamic data;
  _InheritedProvider({Key key,Widget child,this.data})
      :super(child:child);

  @override
  bool updateShouldNotify(_InheritedProvider oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != this.data;
  }

}

