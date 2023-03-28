import 'package:exam/Untils/Database/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/Api_controller.dart';

class SHow_data extends StatefulWidget {
  const SHow_data({Key? key}) : super(key: key);

  @override
  State<SHow_data> createState() => _SHow_dataState();
}

class _SHow_dataState extends State<SHow_data> {
  @override
  Widget build(BuildContext context) {
    Api_Controller api_controller = Get.put(Api_Controller());
    DbHelper dbHelper = DbHelper();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  dbHelper.insertdb(
                      "${api_controller.articles!.title}",
                      "${api_controller.articles!.description}",
                      "${api_controller.articles!.urlToImage}",
                      "${api_controller.articles!.author}");
                  Get.toNamed('data');
                },
                icon: Icon(Icons.download))
          ],
          title: Text("News Details"),
        ),
        body: Column(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Image.network("${api_controller.articles!.urlToImage}",
                  fit: BoxFit.fill),
            ),
            Text(
              "${api_controller.articles!.title}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Text(
              "${api_controller.articles!.description}",
              style: TextStyle(fontSize: 20),
            )),
          ],
        ),
      ),
    );
  }
}
