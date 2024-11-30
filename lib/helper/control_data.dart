import 'package:adv_flutter_mid_exam/helper/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/splash",
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    );
  }
}