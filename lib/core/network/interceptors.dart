import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oil2u/config.dart';
import 'package:oil2u/core/app_export.dart';
import 'package:oil2u/core/network/api_s.dart';
import 'package:oil2u/core/network/logger.dart';

class DioAuthInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      String? token = await PrefUtils().getAccessToken();
      bool needToken = true;
      if (options.uri.toString() ==
              (Config.apiUrl + APIs.register).toString() ||
          options.uri.toString() == (Config.apiUrl + APIs.login).toString()) {
        needToken = false;
      }
      debugLog(message: needToken.toString());
      if (token != null && needToken) {
        options.headers
            .addAll({HttpHeaders.authorizationHeader: "Bearer $token"});
      }
      handler.next(options);
    } catch (e) {}
  }
}
