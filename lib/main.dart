import 'package:flutter/material.dart';
import 'package:project_islami/providers/provider_setting.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_) => SettingProvider(), child: MyApp()));
}
