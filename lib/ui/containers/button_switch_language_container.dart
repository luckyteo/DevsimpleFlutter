import 'package:devsimple_flutter/i18n/app_language.dart';
import 'package:devsimple_flutter/redux/actions/actions_movie.dart';
import 'package:devsimple_flutter/redux/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ButtonSwitchLanguageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    var store = StoreProvider.of<AppState>(context);
    return Container(
      child: IconButton(
        onPressed: () {
          appLanguage
              .currentLanguage()
              .then((value) => {
                    if (value == 'en')
                      {appLanguage.changeLanguage(Locale('vi'))}
                    else
                      {appLanguage.changeLanguage(Locale('en'))}
                  })
              .catchError(
                  (error) => {appLanguage.changeLanguage(Locale('en'))});
                  store.dispatch(ActionGetMovie());
        },
        icon: Icon(
          Icons.translate,
          color: Colors.white,
        ),
      ),
    );
  }
}
