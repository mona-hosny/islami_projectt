import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider extends ChangeNotifier{
  String currentLocal='en';
  ThemeMode currentTheme=ThemeMode.dark;

  changeCurrentLocal(String newLocal)async{
    if(newLocal==currentLocal) return;
    currentLocal=newLocal;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('currentLocal', 'newLocal');
    notifyListeners();

  }
  changeCurrentTheme(ThemeMode newTheme)async{
    if(newTheme==currentTheme)return;
    currentTheme=newTheme;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', newTheme==ThemeMode.dark?'dark':'light');
    notifyListeners();
  }
}