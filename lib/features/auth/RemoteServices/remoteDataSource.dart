import 'dart:convert';
import 'dart:io';

import 'package:ecom/features/auth/auth_exception.dart';
import 'package:ecom/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../utils/apiUtils.dart';
import '../models/user.dart';

class AuthRemoteDataSource {
  User? _user;

  User? get user => _user;

  Future<void> login(String username, String password) async {
    try {
      final url = Uri.parse('https://fakestoreapi.com/auth/login');
      final body = jsonEncode({
        'username': username,
        'password': password,
      });
      final res = await http.post(url,
          headers: {'Content-Type': 'application/json'}, body: body);

      if (res.statusCode == 200) {
        final jsonResponse = jsonDecode(res.body);
        final token = jsonResponse['token'];
        await APIUtils.setToken(token);
        if (kDebugMode) {
          print('Login with username: $username');
        }
        // _user = User.fromJson(jsonResponse);
        print('Login Success: $jsonResponse');
      } else {
        throw AuthException('Failed to login', code: res.statusCode);
      }
    } on SocketException catch (err) {
      throw AuthException('No internet connection ${err.message}');
    } catch (e) {
      if (e is AuthException) {
        print('Auth error: ${e.message} (code: ${e.code})');
      } else {
        print('Unexpected error: $e');
      }
    }
  }

  Future<void> register(String email, String password,
      {String? name, String? avatar}) async {
    try {
      final url = Uri.parse(baseURL + userURL);
      final body = jsonEncode({
        'name': name,
        'email': email,
        'password': password,
        'avatar': avatar
      });
      final res = await http.post(url,
          headers: {'Content-Type': 'application/json'}, body: body);

      if (res.statusCode == 200) {
        final jsonResponse = jsonDecode(res.body);
        if (kDebugMode) {
          print('Registered with email: $email');
        }
        // _user = User.fromJson(jsonResponse);
        if (kDebugMode) {
          print('Registere: $jsonResponse');
        }
      } else {
        throw AuthException('Failed to register user', code: res.statusCode);
      }
    } on SocketException catch (err) {
      AuthException(err.message);
    } on AuthException catch (e) {
      AuthException(e.message, code: e.code);
    } catch (e) {
      if (e is AuthException) {
        if (kDebugMode) {
          print('Auth error: ${e.message} (code: ${e.code})');
        }
      } else {
        if (kDebugMode) {
          print('Unexpected error: $e');
        }
      }
    }
  }
}
