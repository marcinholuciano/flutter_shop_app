import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shop_app/stores/cart_store.dart';

class Cart extends StatefulWidget {
  final CartStore cartStore;

  const Cart({Key? key, required this.cartStore}) : super(key: key);

  @override
  _Cart createState() => _Cart();
}

class _Cart extends State<Cart> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber[400],
        title: const Text('Carrinho de compras'),
        actions: <Widget>[_homeButton()],
      ),
      backgroundColor: Colors.white,
      body: _body(),
      bottomNavigationBar: _bottomCard()
    );
  }

  Widget _homeButton() {
    return IconButton(
      onPressed: (){
        Navigator.pop(context);
      }, 
      icon: const Icon(
        Icons.home
      ),
      iconSize: 30.0,
    );
  }

  Widget _body(){
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(1),
          child: Observer(
            builder: (_){
              return ListView.builder(
                itemCount: widget.cartStore.itemNameList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 80,
                      child: ListTile(
                      leading: const Padding(
                        padding: EdgeInsets.only(left: 10.0, top:20.0),
                        child: Icon(Icons.shopping_cart_checkout_rounded),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top:20.0),
                        child: Text(
                          "${index + 1} - ${widget.cartStore.itemNameList[index]}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15
                          )
                        )
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "R\$ ${widget.cartStore.itemPriceList[index].toString()}",
                          style: const TextStyle(
                            color: Colors.black54,
                            //fontWeight: FontWeight.bold,
                            fontSize: 15
                          )
                        )
                      ),
                      trailing: Padding( 
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextButton(
                          child: Text(
                            "Remover do carrinho",
                            style: TextStyle(
                              color: Colors.red[700],
                              fontSize: 11
                            ),
                          ),
                          onPressed: (){
                            widget.cartStore.removeName(index);
                            widget.cartStore.removePrice(index);
                            widget.cartStore.calcTotal();
                          },
                        )
                      ), 
                    ),
                  );
                },
              );
            }
          )
        ),
      ],
    );
  }

  Widget _bottomCard(){
    return  SizedBox(
      height: 80.0,
      child: Observer(builder: (_){
        return Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green.shade500,
              onPrimary: Colors.white,
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 10.0
            ),
            onPressed: () {
              widget.cartStore.clearNameList();
              widget.cartStore.clearPriceList();
              widget.cartStore.calcTotal();
              Navigator.pop(context);
              messageFinish();
            },
            child: Text(
              widget.cartStore.totalItems == 0 ? "Seu carrinho está vazio" : "Finalizar (R\$ ${widget.cartStore.totalItems.toString()})",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16
              )
            ),
          )
      );
      })
    );
  }

  void messageFinish(){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text("Compra concluída com sucesso!"),
        action: SnackBarAction(label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );

  }
}