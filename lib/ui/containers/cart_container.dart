import 'package:devsimple_flutter/redux/actions/index.dart';
import 'package:devsimple_flutter/redux/models/app_state.dart';
import 'package:devsimple_flutter/redux/models/product.dart';
import 'package:devsimple_flutter/ui/presentation/cart.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CartContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, vm) {
        return CartControl(
          cartProductsByQuantity: vm.cartProductsByQuantity,
          onRemoveFromCart: vm.onRemoveFromCart,
          checkoutPending: vm.checkoutPending,
        );
      },
    );
  }
}

class _ViewModel {
  final Map<Product, int> cartProductsByQuantity;
  final Function(int) onRemoveFromCart;
  final bool checkoutPending;

  _ViewModel(
      {@required this.cartProductsByQuantity,
      @required this.onRemoveFromCart,
      @required this.checkoutPending});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      cartProductsByQuantity: store.state.cart.quantityById.map<Product, int>(
          (key, value) => MapEntry<Product, int>(
              store.state.products.items.firstWhere((p) => p.id == key),
              value)),
      onRemoveFromCart: (productId) =>
          store.dispatch(RemoveFromCart(productId)),
      checkoutPending: store.state.cartStatus.checkoutPending,
    );
  }
}
