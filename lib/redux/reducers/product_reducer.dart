import 'package:devsimple_flutter/redux/actions/index.dart';
import 'package:devsimple_flutter/redux/models/products.dart';
import 'package:redux/redux.dart';

final productsReducer = combineReducers<Products>([
  TypedReducer<Products, ReceiveProducts>(_receiveProductsReducer),
  TypedReducer<Products, AddToCart>(_addToCartProductsReducer),
  TypedReducer<Products, RemoveFromCart>(_removeFromCartProductsReducer),
]);

Products _receiveProductsReducer(Products state, ReceiveProducts action) {
  return state.copyWith(items: [...state.items, ...action.products.items]);
}

Products _addToCartProductsReducer(Products state, AddToCart action) {
  return state.copyWith(
      items: state.items
          .map((e) => e.id == action.productId
              ? e.copyWith(inventory: e.inventory - 1)
              : e)
          .toList());
}

Products _removeFromCartProductsReducer(Products state, RemoveFromCart action) {
  return state.copyWith(
      items: state.items
          .map((e) => e.id == action.productId
              ? e.copyWith(inventory: e.inventory + 1)
              : e)
          .toList());
}
