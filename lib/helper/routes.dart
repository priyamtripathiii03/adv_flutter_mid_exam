import 'package:adv_flutter_mid_exam/views/cart.dart';
import 'package:adv_flutter_mid_exam/views/detail_screen.dart';
import 'package:adv_flutter_mid_exam/views/home_page.dart';
import 'package:flutter/material.dart';


class AppRoutes
{
  static Map<String, Widget Function(BuildContext)> routes={
    "/": (context)=> const HomePage(),
    "/detail": (context)=> const DetailPage(),
    "/cart": (context)=> const CartPage(),



  };
}