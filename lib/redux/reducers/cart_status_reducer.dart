import 'package:devsimple_flutter/redux/actions/index.dart';
import 'package:devsimple_flutter/redux/models/cart_status.dart';
import 'package:redux/redux.dart';

final cartStatusReducer = combineReducers<CartStatus>([
  TypedReducer<CartStatus, Checkout>(_checkoutReducer),
  TypedReducer<CartStatus, CheckoutSuccess>(_checkoutSuccessReducer),
  TypedReducer<CartStatus, CheckoutFailure>(_checkoutFailureReducer),
]);

CartStatus _checkoutReducer(CartStatus state, Checkout action) {
  return state.copyWith(
    checkoutPending: true,
    failed: false,
    error: null,
  );
}

CartStatus _checkoutSuccessReducer(CartStatus state, CheckoutSuccess action) {
  return CartStatus.initial();
}

CartStatus _checkoutFailureReducer(CartStatus state, CheckoutFailure action) {
  return state.copyWith(
    checkoutPending: false,
    failed: true,
    error: action.error,
  );
}
