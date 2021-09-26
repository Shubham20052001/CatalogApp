import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Cart"),
        centerTitle: true,
      ),
    );
  }
}
