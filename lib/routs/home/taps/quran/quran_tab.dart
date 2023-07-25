import 'package:flutter/material.dart';
import 'package:project_islami/models/sura_details_arrguments.dart';
import 'package:project_islami/routs/sura_details/sura_details.dart';
import 'package:project_islami/utilis/app_color.dart';

class QuranTap extends StatelessWidget {
  List suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
              flex: 1,
              child: Image(image: AssetImage('assets/quran_logo.png'))),
          const Divider(
            height: 3,
            thickness: 2,
            color: AppColors.primaryColor,
          ),
          const SizedBox(
            height: 5,
          ),
          Text('sura name',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 5,
          ),
          const Divider(height: 3, thickness: 2, color: AppColors.primaryColor),
          Expanded(
            flex: 3,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return buildSuraNameItem(context, index);
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 5,
                    thickness: 2,
                    color: AppColors.primaryColor,
                  );
                },
                itemCount: suraName.length),
          )
        ],
      ),
    );
  }

  Widget buildSuraNameItem(BuildContext context, index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetails.routName,
            arguments: SuraDetailsArgs(
                fileName: '${index + 1}.txt', suraName: suraName[index]));
      },
      child: Text(suraName[index],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall),
    );
  }
}
