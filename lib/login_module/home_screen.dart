import 'package:api_ui_test_project/helper/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: WillPopScope(
              onWillPop: ()async {
                Get.offAllNamed(Routes.login);
                return true;
              },
              child: Center(child: Text("Home"))),
    );
  }
}
