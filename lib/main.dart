import 'package:devsimple_flutter/redux/models/app_state.dart';
import 'package:devsimple_flutter/redux/store/config_store.dart';
import 'package:devsimple_flutter/ui/screens/screen_cart.dart';
import 'package:devsimple_flutter/ui/screens/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import 'i18n/app_language.dart';
import 'i18n/app_localizations.dart';

void main() async {
  // AppLanguage appLanguage = AppLanguage();
  // await appLanguage.fetchLocale();
  runApp(MyApp(
    store: configureStore(),
  ));

  /**/
}

class MyApp extends StatelessWidget {
  final Store store;

  MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: store,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
          ],
          child: Consumer<AppLanguage>(
            builder: (context, model, child) {
              return MaterialApp(
                title: 'Redux Saga Shopping Cart Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                debugShowCheckedModeBanner: false,
                locale: model.appLocal,
                supportedLocales: [
                  Locale('en', 'US'),
                  Locale('vi', ''),
                ],
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                routes: {
                  '/': (context) => HomePage(),
                  '/cart': (context) => CartPage(),
                },
              );
            },
          ),
        ));
  }
}
