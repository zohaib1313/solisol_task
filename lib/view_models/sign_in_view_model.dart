import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:solisoltask/utils/app_popups.dart';

class SignInViewModel extends ChangeNotifier {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController =
      TextEditingController(text: 'eve.holt@reqres.in');
  TextEditingController passwordController =
      TextEditingController(text: 'pistol');

  void signIn(context) async {
    AppPopUps.showLoaderDialog(context);
    http.Response response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      body: {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim()
      },
    );

    var result = jsonDecode(response.body);
    AppPopUps.dissmissDialog();
    if (response.statusCode == 200) {
      AppPopUps.showSnackBar("User signed up success");
    } else {
      AppPopUps.showSnackBar(result['error']);
    }
  }
}
