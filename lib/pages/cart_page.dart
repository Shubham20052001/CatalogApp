import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text
              .xl5
              .color(Theme.of(context).accentColor)
              .make(),
          30.widthBox,
          ElevatedButton(
            child: const Text("Buy"),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).buttonColor),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Buying not supported yet."),
                duration: Duration(seconds: 1),
              ));
            },
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? const Center(
            child: Text("No items in the cart."),
          )
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () {
                    _cart.remove(_cart.items[index]);
                    // setState(() {});
                  },
                  icon: Icon(Icons.remove_circle_outline)),
              title: Text(_cart.items[index].name),
            ),
          );
  }
}
