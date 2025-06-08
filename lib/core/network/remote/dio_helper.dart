


import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../app_constant.dart';
import '../../di/di.dart';
import 'api_endpoint.dart';
import 'interceptor/app_interceptor.dart';
import 'interceptor/logger_interceptor.dart';
import '../../services/shared_prefrence/cach_helper.dart';

class DioHelper {
  DioHelper._();
  static Dio? _dio;

  static Dio get init {
    {
      if (_dio == null) {
        _dio = Dio(
          BaseOptions(
            receiveDataWhenStatusError: true,

            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            headers: {
              'Accept-Language': 'ar',
              'Content-Type': 'application/json',

              'Authorization':
                  'Bearer ${CachHelper.getData(key: AppConstant.tokenKey)}',
            },

            baseUrl: ApiEndpoint.baseUrl,
          ),
        );
          _dio?.interceptors.add(getIt<AppInterceptor>());
          
          if (kDebugMode) {
             _dio?.interceptors.add(getIt<LoggerInterceptor>());

            
          }
          
            
      

        return _dio!;
      }

      return _dio!;
    }
  }
}




