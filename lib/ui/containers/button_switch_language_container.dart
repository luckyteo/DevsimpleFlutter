import 'package:devsimple_flutter/i18n/app_language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonSwitchLanguageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
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
        },
        icon: Icon(
          Icons.translate,
          color: Colors.white,
        ),
      ),
    );
  }
}
