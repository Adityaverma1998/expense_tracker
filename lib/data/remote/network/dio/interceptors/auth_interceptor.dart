import 'package:dio/dio.dart';
import 'package:expense_tracker/data/sharedpref/shared_pref_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  final AsyncValueGetter<String?> accessToken;
  final SharedPrefHelper sharedPrefs;
  // final NavigationService _navService = getIt<NavigationService>();

  AuthInterceptor({
    required this.accessToken,
    required this.sharedPrefs,
  });

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['content-type'] = 'application/json';
    final token = await accessToken() ?? '';
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401) {
      await _handleUnauthorized();
    }
    handler.next(response);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await _handleUnauthorized();
    }
    handler.next(err);
  }

  Future<void> _handleUnauthorized() async {
    // await sharedPrefs.saveIsLoggedIn(false);
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    // _navService.navigateTo(Routes.login);
  }
}
