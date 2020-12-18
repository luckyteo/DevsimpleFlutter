import 'package:devsimple_flutter/redux/models/app_state.dart';
import 'package:devsimple_flutter/redux/reducers/product_reducer.dart';

import 'cart_reducer.dart';
import 'cart_status_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    products: productsReducer(state.products, action),
    cart: cartReducer(state.cart, action),
    cartStatus: cartStatusReducer(state.cartStatus, action),
  );
}
