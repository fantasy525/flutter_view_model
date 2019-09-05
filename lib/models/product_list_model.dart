// created by ZuoXiaoFei at 2019-09-05
import 'dart:convert' show json;

class ProductListModel {

  List<Product> list;

  ProductListModel.fromParams({this.list});

  factory ProductListModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new ProductListModel.fromJson(json.decode(jsonStr)) : new ProductListModel.fromJson(jsonStr);

  ProductListModel.fromJson(jsonRes) {
    list = jsonRes == null ? null : [];

    for (var listItem in list == null ? [] : jsonRes['list']){
      list.add(listItem == null ? null : new Product.fromJson(listItem));
    }
  }

  @override
  String toString() {
    return '{"json_list": $list}';
  }
}

class Product {

  int price;
  String date;
  String name;

  Product.fromParams({this.price, this.date, this.name});

  Product.fromJson(jsonRes) {
    price = jsonRes['price'];
    date = jsonRes['date'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"price": $price,"date": ${date != null?'${json.encode(date)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'}}';
  }
}

