import 'package:flutter/material.dart';
import 'package:project_islami/providers/provider_setting.dart';
import 'package:project_islami/utilis/app_color.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    return Container(color: Colors.white,
      child: Column(
        children: [
          Text(
            'select your language',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              provider.currentLocal='en';
              provider.notifyListeners();
              Navigator.pop(context);


            },
            child: selectLanguage(provider.currentLocal=='en', 'English',context),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              provider.currentLocal='ar';
              provider.notifyListeners();
              Navigator.pop(context);


            },
            child: selectLanguage(provider.currentLocal=='ar', 'Arabic',context),
          )
        ],
      ),
    );
  }

  selectLanguage(bool selectLanguageOfSheet, String language,BuildContext context) {
    if (selectLanguageOfSheet) {
      return Text(
        language,
        style:Theme.of(context).textTheme.titleMedium,
      );
    } else {
      return Text(
        language,
        style: Theme.of(context).textTheme.bodyMedium,
      );
    }
  }
}
