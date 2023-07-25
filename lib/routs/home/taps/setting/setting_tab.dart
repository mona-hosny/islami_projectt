import 'package:flutter/material.dart';
import 'package:project_islami/providers/provider_setting.dart';
import 'package:project_islami/utilis/app_color.dart';
import 'package:provider/provider.dart';

import 'language_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingTap extends StatelessWidget {
  static String routName = 'setting';
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          const Spacer(flex: 3),
      Text(AppLocalizations.of(context)!.language,
          style: Theme
              .of(context)
              .textTheme
              .titleSmall),
      const SizedBox(
        height: 22,
      ),
      InkWell(
          onTap: () => onLanguagePress(context),
          child: getRowOption(
              provider.currentLocal == 'en' ? 'English' : 'arabic')),
      const SizedBox(
        height: 22,
      ),
      Row(
          children: [
            Text(AppLocalizations.of(context)!.mode,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall),const Spacer(),
            Switch(value: switchValue, onChanged: (newSwitchValue) {
              switchValue = newSwitchValue;
              if (switchValue = true) {
               provider.changeCurrentTheme(ThemeMode.light);
              } else {
                provider.changeCurrentTheme(ThemeMode.dark);
              }
            },)
          ])


      ,





    const SizedBox

    (

    height: 22),
    getRowOption(AppLocalizations.of(context)!.light),
    const Spacer(
    flex: 15,
    )
    ],
    )
    ,
    );
  }

  Widget getRowOption(String textRow) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.secondColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(textRow,
              style:
              const TextStyle(fontSize: 14, color: AppColors.primaryColor)),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }

  onLanguagePress(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }
}
