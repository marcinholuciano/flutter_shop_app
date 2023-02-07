import 'package:mobx/mobx.dart';
part 'cart_store.g.dart';

// ignore: library_private_types_in_public_api
class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {

  @observable
  double totalItems = 0.0;

  @action
  void calcTotal(){
    totalItems = 0.0;

    for (int i = 0; i < itemPriceList.length; i++) {
        totalItems = totalItems + itemPriceList[i];
    }
  }

  ObservableList<String> itemNameList = ObservableList<String>();

  @action
  void addName(String name){
    itemNameList.add(name);
  }

  @action
  void removeName(int index){
    itemNameList.removeAt(index);
  }

  @action
  void clearNameList(){
    itemNameList.clear();
  }

  ObservableList<double> itemPriceList = ObservableList<double>();

  @action
  void addPrice(double price){
    itemPriceList.add(price);
  }

  @action
  void removePrice(int index){
    itemPriceList.removeAt(index);
  }

  @action
  void clearPriceList(){
    itemPriceList.clear();
  }
  
}