import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  static final Dio dio = Dio(BaseOptions(
    baseUrl: dotenv.env['API_URL'] ?? 'http://localhost:3000',
    followRedirects: false,
    validateStatus: (status) => status! < 500,
  ));


  static final cookieJar = CookieJar();

  static void setup() {
    
    print(dotenv.env['API_URL']);
    // Add CookieManager only if not running on the web
    if (!kIsWeb) {
      dio.interceptors.add(CookieManager(cookieJar));
    }

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("Se trimite request către: ${options.uri}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("Răspuns primit: ${response.statusCode}");
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          print("Token expirat, încercăm refresh...");
          bool refreshed = await _refreshToken();
          if (refreshed) {
            return handler.resolve(await _retry(e.requestOptions));
          }
        }
        return handler.next(e);
      },
    ));
  }

  static Future<bool> _refreshToken() async {
    try {
      Response response = await dio.get('/auth/refresh');
      if (response.statusCode == 200) {
        print("Token reîmprospătat cu succes!");
        return true;
      }
    } catch (e) {
      print("Eroare la refresh token: $e");
    }
    return false;
  }

  static Future<Response> _retry(RequestOptions requestOptions) async {
    return dio.request(
      requestOptions.path,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      ),
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
    );
  }
}
