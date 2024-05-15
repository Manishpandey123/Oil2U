import 'package:dio/dio.dart';
import 'package:oil2u/core/network/data_logger.dart';
import 'package:oil2u/core/network/interceptors.dart';

import '../../config.dart';

late final Dio dio;

class InitDio {
  call() {
    dio = Dio(
      BaseOptions(
        contentType: "application/json",
        baseUrl: Config.apiUrl,
      ),
    )..interceptors.addAll([
        DioAuthInterceptors(),
        DataLogger(),
      ]);
  }
}
