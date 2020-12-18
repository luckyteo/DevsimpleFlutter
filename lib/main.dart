import 'package:devsimple_flutter/redux/models/app_state.dart';
import 'package:devsimple_flutter/redux/store/config_store.dart';
import 'package:devsimple_flutter/ui/screens/screen_cart.dart';
import 'package:devsimple_flutter/ui/screens/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(MyApp(store: configureStore()));
}

class MyApp extends StatelessWidget {
  final Store store;

  MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Redux Saga Shopping Cart Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => HomePage(),
            '/cart': (context) => CartPage(),
          },
        ));
  }
}
