import 'package:flutter/material.dart';
import 'package:project_islami/utilis/app_color.dart';

class SebhaTab extends StatefulWidget {
  static String routName = 'sebha';

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int tasbehCounter = 0;

  List<String> tasbehList = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
    'لا اله الا الله',
    'لا حول ولا قوة الا بالله'
  ];

  int index = 0;
  double angle=0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(children: [
          GestureDetector(
            onTap:onTasbehTab,
            child: Stack(alignment: Alignment.topCenter, children: [
              Image.asset('assets/head of seb7a.png'),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.09,
                    bottom: MediaQuery.of(context).size.height * 0.02),
                child: Transform.rotate(angle: angle,child: Image.asset('assets/body of seb7a.png')),
              )
            ]),
          ),
           Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColors.secondColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                '$tasbehCounter',
                style:
                    Theme.of(context).textTheme.bodyLarge,
              )),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.secondColor,
                borderRadius: BorderRadius.circular(25)),
            child: Text('${tasbehList[index]}',
                style: Theme.of(context).textTheme.titleLarge),
          ),
        ]));
  }

  void onTasbehTab() {
    tasbehCounter++;
    if (tasbehCounter % 33 == 0) {
      index++;
    }
    if (index == tasbehList.length) {
      index = 0;
      
    }
    angle+=20;
    setState(() {

    });
  }
}
