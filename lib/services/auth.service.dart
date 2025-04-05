import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:pitstop/models/user.model.dart';
import 'api_client.dart';

class AuthService {
  final Dio _dio = ApiClient.dio;

  // 🔹 Login: trimite credențialele și backend-ul setează cookie-urile
  Future<bool> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'password': generateMD5((password))},
      );

      if (response.statusCode != HttpStatus.unauthorized) {
        print("Autentificare reușită!");
        return true;
      }
    } catch (e) {
      print("Eroare la login: $e");
    }
    return false;
  }

  // 🔹 Logout: backend-ul va șterge cookie-urile
  Future<void> logout() async {
    try {
      await _dio.post('/auth/logout');
      print("Delogat cu succes!");
    } catch (e) {
      print("Eroare la logout: $e");
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      Response response = await _dio.get('/auth/user');
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      }
    } catch (e) {
      print("Eroare la obținerea userului curent: $e");
    }

    return null;
  }

  //  Verifică dacă utilizatorul este autentificat
  Future<bool> isAuthenticated() async {
    try {
      Response response = await _dio
          .get('/auth/user'); // Endpoint care returnează userul autenticat
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  String generateMD5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
