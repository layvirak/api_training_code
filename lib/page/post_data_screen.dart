import 'package:api_training/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDataScreen extends StatelessWidget {
  PostDataScreen({Key? key}) : super(key: key);
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final _usercontroller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Screen'),
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                hintText: 'Input First Name',
              ),
            ),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                hintText: 'Input Lat Name',
              ),
            ),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(
                hintText: 'Input Age Name',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _usercontroller.postUserFunc(firstNameController.text,
                    lastNameController.text, ageController.text);
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
