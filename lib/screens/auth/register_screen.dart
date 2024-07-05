import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/auth/registration_controller.dart';
import '../../utils/colors.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 140,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Register".toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: MyColors.textfieldColor,
                          fontSize: 28),
                    ),
                  ),
                ),
                TextFormField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      labelText: 'Username',
                      labelStyle: TextStyle(color: MyColors.textfieldColor),
                      errorStyle: TextStyle(color: MyColors.textfieldColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    if (!controller.validateUsername(value)) {
                      return 'Username must be 3-15 characters and contain only letters and numbers';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: MyColors.textfieldColor),
                      errorStyle: TextStyle(color: MyColors.textfieldColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      )),
                  validator: controller.validateEmail,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: MyColors.textfieldColor),
                      errorStyle: TextStyle(color: MyColors.textfieldColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      )),
                  obscureText: true,
                  validator: controller.validatePassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.confirmPasswordController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: MyColors.textfieldColor),
                      errorStyle: TextStyle(color: MyColors.textfieldColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyColors.textfieldColor, width: 1),
                      )),
                  obscureText: true,
                  validator: controller.validateConfirmPassword,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.register,
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      backgroundColor: MyColors.buttonColor,
                      minimumSize: const Size(180, 50)),
                  child: Text(
                    'Register',
                    style: TextStyle(color: MyColors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
