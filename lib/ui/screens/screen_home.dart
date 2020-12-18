import 'package:devsimple_flutter/ui/containers/cart_button_container.dart';
import 'package:devsimple_flutter/ui/containers/products_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: <Widget>[CartButtonContainer()],
      ),
      body: ProductsContainer(),
    );
  }
}
