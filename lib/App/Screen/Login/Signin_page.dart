import 'package:exam/Untils/Shared_Prefrense/Login_.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin_page extends StatefulWidget {
  const Signin_page({Key? key}) : super(key: key);

  @override
  State<Signin_page> createState() => _Signin_pageState();
}

class _Signin_pageState extends State<Signin_page> {
  SharedPreferences? sharedPrefere;
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login "),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtemail,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email_outlined),
                  label: Text("Email"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtpassword,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye),
                  label: Text("Password"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                SheredHelper.sheredHelper.Addlogin(
                    txtemail.text, txtpassword.text);
                SheredHelper.sheredHelper.reademail();
                SheredHelper.sheredHelper.reagpassword();
                Get.toNamed('a');
              },
              child: Text("Sign in "),
            ),
          ],
        ),
      ),
    );
  }
}
