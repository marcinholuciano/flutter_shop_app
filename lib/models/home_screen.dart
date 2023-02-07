import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shop_app/models/products_home.dart';
import 'package:shop_app/stores/cart_store.dart';
import 'package:shop_app/widgets/item_widget.dart';
import 'package:shop_app/models/cart_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CartStore cartStore = CartStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[400],
        title: const Text('Bem-vindo!'),
        actions: <Widget>[_cartButton()],
      ),
      backgroundColor: Colors.white,
      body: _productList()
    );
  }

  Widget _productList() {
    return ListView.builder(
      itemCount: Products.products.length,
      itemBuilder: (context, index) {
        return ItemWidget(
          item: Products.products[index],
          cartInstance: cartStore,
        );
      },
    );
  }

  Widget _cartButton() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        IconButton(
          iconSize: 30,
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>Cart(cartStore: cartStore))
            );    
          },
        ),
        _itemsCounter() 
      ],
    );
  }

  Widget _itemsCounter() {
    return Positioned(
      right: 5,
      top: 5,
      child: Observer(
        builder: (_){
          return Container(
            padding: const EdgeInsets.all(2),
            decoration: cartStore.itemNameList.isNotEmpty ? BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ) : null,
            constraints: const BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: cartStore.itemNameList.isNotEmpty ? Text(
              '${cartStore.itemNameList.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ) : null
          );
        }
      )    
    );
  }
}
