

import 'package:dio/dio.dart';
import '../../lang/localization_service.dart';

import 'api_error_model.dart';

class ApiErrorHandler implements Exception {
  static ApiErrorModel handle(dynamic error) {
    final s = LocalizationService.instance.strings;

    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: s.error_connection,code:  error.response?.statusCode );

        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: s.error_connection_timeout,code:  error.response?.statusCode );

        case DioExceptionType.cancel:
          return ApiErrorModel(message: s.error_cancelled,code:  error.response?.statusCode );

        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: s.error_receive_timeout,code:  error.response?.statusCode );

        case DioExceptionType.unknown:
          return ApiErrorModel(message: s.error_unknown,  code:  error.response?.statusCode );

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: s.error_send_timeout,code:  error.response?.statusCode );

        case DioExceptionType.badResponse:
          return _handleError(error.response?.statusCode );

        default:
          return ApiErrorModel(message: s.error_default);
      }
    } else {
      return ApiErrorModel(message: s.error_unknown_occurred);
    }
  }
}

ApiErrorModel _handleError(int? statusCode) {
  final s = LocalizationService.instance.strings;

  switch (statusCode) {
    case 400:
      return ApiErrorModel(message: s.error_bad_request,code:  statusCode);
    case 401:
      return ApiErrorModel(message: s.error_unauthorized,code:  statusCode);
    case 403:
      return ApiErrorModel(message: s.error_forbidden,code:  statusCode);
    case 404:
      return ApiErrorModel(message: s.error_not_found,code:  statusCode);
    case 500:
      return ApiErrorModel(message: s.error_server,code:  statusCode);
    default:
      return ApiErrorModel(message: s.error_bad_response,code:  statusCode);
  }
}
