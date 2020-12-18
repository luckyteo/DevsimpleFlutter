import 'package:devsimple_flutter/ui/containers/cart_container.dart';
import 'package:devsimple_flutter/ui/containers/cart_footer_container.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: CartContainer(),
      bottomNavigationBar: CartFooterContainer(),
    );
  }
}
