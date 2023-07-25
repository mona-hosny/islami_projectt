import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_islami/providers/provider_setting.dart';
import 'package:project_islami/routs/hadeth_details/hadeth_details.dart';
import 'package:project_islami/routs/home/home_screen.dart';
import 'package:project_islami/routs/home/taps/setting/setting_tab.dart';
import 'package:project_islami/routs/sura_details/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_islami/utilis/app_theme_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  String currentLocal = 'en';
  late SettingProvider provider;

  @override
  Widget build(BuildContext context) {
     provider = Provider.of(context);
     initialSharedPreference();
    return MaterialApp(
      themeMode: provider.currentTheme,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // arabic
      ],
      locale: Locale(provider.currentLocal),
      routes: {
        HomeScreen.routName: (_) => HomeScreen(),
        SuraDetails.routName: (_) => SuraDetails(),
        HadethDetails.routName: (_) => HadethDetails(),
        SettingTap.routName: (_) => SettingTap(),
      },
      initialRoute: HomeScreen.routName,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
  void initialSharedPreference()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme=prefs.getString('currentTheme')??'light';
    String language =prefs.getString('currentLocal')??'en';
    provider.changeCurrentLocal(language);
    if(theme=='light'){
      provider.changeCurrentTheme(ThemeMode.light);
    }else{
      provider.changeCurrentTheme(ThemeMode.dark);
    }
  }
}
