import 'package:exam/App/Screen/Api/Modal/'
    'Api_modal.dart';
import 'package:get/get.dart';

class Api_Controller extends GetxController
{
  Rx<ApiModal> l1 = ApiModal().obs;

  Articles? articles ;

  void adddata(Articles h1)
  {
    articles = h1;
    update();
  }
}