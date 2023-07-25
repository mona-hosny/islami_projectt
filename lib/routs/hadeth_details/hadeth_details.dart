import 'package:flutter/material.dart';
import 'package:project_islami/models/hadeth.dart';

import '../../utilis/app_color.dart';
class HadethDetails extends StatelessWidget {
 static String routName='hadeth details';

  @override
  Widget build(BuildContext context) {
    var hadeth =ModalRoute.of(context)!.settings .arguments as Hadeth;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/backgrund.png'), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(centerTitle: true,
          title: Text(hadeth.tittle),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(child: Text(hadeth.content,style: const TextStyle(
            fontSize: 20,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500)))
      ),
    );
  }

}

