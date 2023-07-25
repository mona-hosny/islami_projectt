import 'package:flutter/material.dart';
import 'package:project_islami/providers/provider_setting.dart';
import 'package:project_islami/routs/home/taps/ahadeth/ahadeth_tab.dart';
import 'package:project_islami/routs/home/taps/quran/quran_tab.dart';
import 'package:project_islami/routs/home/taps/radio_tab/radio_tab.dart';
import 'package:project_islami/routs/home/taps/sebha/sebha_tab.dart';
import 'package:project_islami/routs/home/taps/setting/setting_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../utilis/app_color.dart';

class HomeScreen extends StatefulWidget {
  static String routName='homeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int currentTap = 0;

  List<Widget> tabs = [
    QuranTap(),
     AhadethTab(),
     SebhaTab(),
    RadioTab(),SettingTap()
  ];


  @override
  Widget build(BuildContext context) {
    SettingProvider provider = Provider.of(context);
    return Container(decoration:  BoxDecoration(image: DecorationImage(image: AssetImage(provider.currentTheme==ThemeMode.light?'assets/backgrund.png':'assets/bg.png'),fit:BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(title:  Text(AppLocalizations.of(context)! .islami
          ,
          style: Theme.of(context).textTheme.titleMedium,
        )),
        body: tabs[currentTap],
        bottomNavigationBar:
             BottomNavigationBar(
              currentIndex: currentTap,
              onTap: (tappedTap) {
                currentTap = tappedTap;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    label: 'Quran',
                    icon: ImageIcon(AssetImage('assets/icon_quran.png'))),
                BottomNavigationBarItem(
                    label: 'Ahadeth',
                    icon: ImageIcon(AssetImage('assets/quran.png'))),
                BottomNavigationBarItem(
                    label: 'Sebha',
                    icon: ImageIcon(AssetImage('assets/sebha_gold.png'))),
                BottomNavigationBarItem(
                    label: 'Radio',
                    icon: ImageIcon(AssetImage('assets/icon_radio.png'))),
                BottomNavigationBarItem(
                    label: 'setting',
                    icon: Icon(Icons.settings)
                )],

            )),
      );

  }
}
