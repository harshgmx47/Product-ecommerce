import 'package:ecom/features/auth/auth_reposiroty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

import '../../utils/apiUtils.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthRepository authService = AuthRepository();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  bool validateUsername(String username) {
    // Check if the username is not empty
    if (username.isEmpty) {
      return false;
    }

    // Check if the username is between 3 and 15 characters
    if (username.length < 3 || username.length > 15) {
      return false;
    }

    // Check if the username contains only alphanumeric characters
    final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
    if (!validCharacters.hasMatch(username)) {
      return false;
    }

    return true;
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      await authService.login(emailController.text, passwordController.text);
      final token = APIUtils.getToken();
      if (token != null) {
        print('User is logged in with token: $token');
        // Get.offNamed("/products");
        QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.success,
          text: 'Login  Successfully!',
          onConfirmBtnTap: () => Get.offNamed("/products"),
        );
      } else {
        print('Login failed');
      }
    }
  }
}
