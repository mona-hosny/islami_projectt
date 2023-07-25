import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_islami/models/hadeth.dart';
import 'package:project_islami/routs/hadeth_details/hadeth_details.dart';

import '../../../../utilis/app_color.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethList .isEmpty){readHadethContent();}

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Expanded(
              flex: 1,
              child: Image(image: AssetImage('assets/ahadeth_logo.png'))),
          const Divider(
            height: 3,
            thickness: 2,
            color: AppColors.primaryColor,
          ),
          const SizedBox(
            height: 5,
          ),
           Text('ahadeth',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 5,
          ),
          const Divider(height: 3, thickness: 2, color: AppColors.primaryColor),
          Expanded(
              flex: 3,
              child: ListView.separated(itemBuilder: (context, index) {
                return buildHadethNameItem(context, index);
              }, separatorBuilder: (context, index) {
                return const Divider(
                  color: AppColors.primaryColor, height: 2, thickness: 3,);
              }, itemCount: ahadethList.length)
          ),
        ]);
  }

  Widget buildHadethNameItem(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetails.routName,
            arguments: ahadethList[index]);
      },
      child: Text(ahadethList[index].tittle,
          style: Theme.of(context).textTheme.titleSmall
      ),
    );
  }

  readHadethContent()async{
   String hadethFile =await rootBundle.loadString('assets/files/ahadeth.txt');
   List<String> ahadeth=hadethFile.split('#\r\n' );
   for(int i=0;i<ahadeth.length;i++){
     print(ahadeth[i]);
     List<String> singleHadethLines=ahadeth[i].trim().split('\n');
     String tittle=singleHadethLines.removeAt(0);
     String content=singleHadethLines.join('\n');
     ahadethList.add(Hadeth(tittle, content));

   }
setState(() {});
  }
}
