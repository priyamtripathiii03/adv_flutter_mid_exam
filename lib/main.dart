import 'package:adv_flutter_mid_exam/helper/control_data.dart';
import 'package:adv_flutter_mid_exam/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomeProvider(),),],
      builder: (context, child) => const MyApp()));
}