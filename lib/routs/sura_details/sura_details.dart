import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_islami/models/sura_details_arrguments.dart';
import 'package:project_islami/utilis/app_color.dart';

class SuraDetails extends StatefulWidget {
  static String routName = 'sura details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> suraLines = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (suraLines.isEmpty);
    readSuraContent('${args.fileName}');
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/backgrund.png'), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(centerTitle: true,
          title: Text(args.suraName,style: const TextStyle(color: AppColors.primaryColor)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: suraLines.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return Text(
                    '${suraLines[index]}',textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodySmall,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 3,
                    thickness: 2,
                    color: AppColors.primaryColor,
                  );
                },
                itemCount: suraLines.length),
      ),
    );
  }

  readSuraContent(String fileName) async {
    String suraContent = await rootBundle.loadString('assets/files/$fileName');
    suraLines = suraContent.trim().split('/n');
    setState(() {});
  }
}
