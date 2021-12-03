import 'dart:convert';

import 'package:api_training/model/user_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var userModel = UserModel().obs;
  var loading = false.obs;
  //Get==============================
  Future<void> getUserFunc() async {
    loading(true);
    var headers = {
      "Accept": "application/json",
      "Content-Type": 'application/json',
    };
    try {
      print('do');
      String url = "https://peopleinfoapi.herokuapp.com/api/person";
      await http.get(Uri.parse(url), headers: headers).then((response) {
        print('status code : ${response.statusCode}');
        if (response.statusCode == 200) {
          var responseBody = jsonDecode(response.body);
          userModel.value = UserModel.fromJson(responseBody);
          print(userModel.value.data![0].firstName);
        } else if (response.statusCode < 500) {
          print('Something Wrong');
        } else {
          print("Server error");
        }
      });
    } catch (e) {
      print(e);
    } finally {
      loading(false);
    }
  }

  //Post=========================================
  Future<void> postUserFunc(
      String firstName, String lastName, String age) async {
    loading(true);
    try {
      String url = "https://peopleinfoapi.herokuapp.com/api/person";
      await http.post(Uri.parse(url), body: {
        "first_name": firstName,
        "last_name": lastName,
        "age": age,
        "active_date": "111",
      }).then((response) {
        print('status code : ${response.statusCode}');
      });
    } catch (e) {
      print(e);
    } finally {
      loading(false);
    }
  }

  //delete=============================================
  Future<void> dleteUserFunc(int id) async {
    loading(true);
    try {
      String url = "https://peopleinfoapi.herokuapp.com/api/person/$id";
      await http.delete(Uri.parse(url)).then((response) {
        if (response.statusCode == 200) {
          getUserFunc();
        } else if (response.statusCode < 500) {
          print('Something Wrong');
        } else {
          print("Server error");
        }
      });
    } catch (e) {
      print(e);
    } finally {
      loading(false);
    }
  }
}
