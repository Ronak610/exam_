import 'package:exam/App/Screen/Api/Controller/Api_controller.dart';
import 'package:exam/App/Screen/Api/Modal/Api_modal.dart';
import 'package:exam/Untils/Api_http/Api_http.dart';
import 'package:exam/Untils/Database/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Api_Page extends StatefulWidget {
  const Api_Page({Key? key}) : super(key: key);

  @override
  State<Api_Page> createState() => _Api_PageState();
}

class _Api_PageState extends State<Api_Page> {
  DbHelper dbHelper = Get.put(DbHelper());
  Api_Controller api_controller = Get.put(Api_Controller());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("News"),
        ),
        body: FutureBuilder<ApiModal?>(
          future: Api_http.api_http.news(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              ApiModal? h1 = snapshot.data;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: h1!.articles!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      api_controller.adddata(h1.articles![index]);
                      Get.toNamed('show');
                    },
                    child: ListTile(
                      leading:
                          Image.network("${h1.articles![index].urlToImage}"),
                      title: Text("${h1.articles![index].title}"),
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
