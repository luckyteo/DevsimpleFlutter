import 'package:devsimple_flutter/i18n/app_localizations.dart';
import 'package:devsimple_flutter/ui/containers/button_switch_language_container.dart';
import 'package:devsimple_flutter/ui/containers/cart_button_container.dart';
import 'package:devsimple_flutter/ui/containers/products_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('title')),
        actions: <Widget>[CartButtonContainer(),
        ButtonSwitchLanguageContainer()],
      ),
      body: ProductsContainer(),
    );
  }
}
