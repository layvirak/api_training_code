// ignore_for_file: prefer_const_constructors

import 'package:api_training/controller/user_controller.dart';
import 'package:api_training/page/post_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => PostDataScreen());
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: _userController.loading.value == true
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          _userController.getUserFunc();
                        },
                        child: Text("get user"),
                      ),
                      if (_userController.userModel.value.data != null)
                        Column(
                          children:
                              _userController.userModel.value.data!.map((e) {
                            return ListTile(
                              title: Text("${e.firstName} ${e.lastName}"),
                              subtitle: Text("${e.age}"),
                              trailing: IconButton(
                                onPressed: () {
                                  _userController.dleteUserFunc(e.id!);
                                },
                                icon: Icon(Icons.delete),
                              ),
                            );
                          }).toList(),
                          // children: [
                          //   TextButton(
                          //     onPressed: () {
                          //       _userController.getUserFunc();
                          //     },
                          //     child: const Text('Get User'),
                          //   ),
                          // ],
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
