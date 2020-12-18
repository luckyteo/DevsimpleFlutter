import 'package:devsimple_flutter/redux/models/app_state.dart';
import 'package:devsimple_flutter/redux/models/cart.dart';

double getCartTotal(AppState state) => state.cart.quantityById.keys.fold(
    0,
    (sum, productId) =>
        sum +
        state.cart.quantityById[productId] *
            state.products.items.singleWhere((p) => p.id == productId).price);

getCartItemCount(AppState state) =>
    state.cart.quantityById.values.fold(0, (sum, quantity) => sum + quantity);

Cart getCart(AppState state) => state.cart;
