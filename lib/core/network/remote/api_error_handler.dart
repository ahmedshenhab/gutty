

import 'package:dio/dio.dart';
import 'package:gutty/core/lang/localization_service.dart';

import 'api_error_model.dart';

class ApiErrorHandler implements Exception {
  // late ApiErrorModel apiErrorModel;

  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: LocalizationService.strings.error_connection);

        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message:  LocalizationService.strings.error_timeout);

        case DioExceptionType.cancel:
          return ApiErrorModel(message:  LocalizationService.strings.error_cancelled);

        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message:  LocalizationService.strings.error_receive_timeout);

        case DioExceptionType.unknown:
          return ApiErrorModel(
            message: LocalizationService.strings.error_unknown,
          );

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message:  LocalizationService.strings.error_send_timeout);

        case DioExceptionType.badResponse:
          return _handleError(error);

        default:
          return ApiErrorModel(message: 'unknown error occured');
      }
    } else {
      return ApiErrorModel(message:  LocalizationService.strings.error_unknown_general);
    }
  }
}

ApiErrorModel _handleError(dynamic e) {


  return ApiErrorModel(message:  LocalizationService.strings.error_bad_response);
}
