import 'package:exam/App/Screen/Api/View/Api_page.dart';
import 'package:exam/App/Screen/Api/View/Show_Page.dart';
import 'package:exam/App/Screen/Data/database_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'App/Screen/Login/Signin_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Signin_page(),
        'a': (context) => Api_Page(),
        'show': (context) => SHow_data(),
        'data': (context) => Database_Screen(),
      },
    ),
  );
}
