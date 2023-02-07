import 'package:flutter/material.dart';
import 'package:shop_app/models/products_home.dart';
import 'package:shop_app/stores/cart_store.dart';

class ItemWidget extends StatelessWidget {
  final CartStore cartInstance;
  final Item item;
  const ItemWidget({Key? key, required this.item, required this.cartInstance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(//                           <-- Card
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0), 
          child:ListTile(
            leading: Image.network(
              item.image, 
              height: 90, 
              width: 90
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 1.0),
              child: Text(
                item.name,
                style: const TextStyle(
                  color: Colors.black,
                  //fontWeight: FontWeight.bold,
                  fontSize: 16
                )
              )
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(bottom: 1.0),
              child: Text(
                "R\$ ${item.price.toString()}",
                style: TextStyle(
                  color: Colors.green.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                )
              )
            ),
            
            trailing: Padding( 
              padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
              child: TextButton(
                child: Text(
                  "Adicionar ao carrinho",
                  style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 11
                  ),
                ),
                onPressed: (){
                  cartInstance.addName(item.name);
                  cartInstance.addPrice(item.price);
                  cartInstance.calcTotal();
                },
              )
            )
          ) 
        ),
      )
    );
  }
}