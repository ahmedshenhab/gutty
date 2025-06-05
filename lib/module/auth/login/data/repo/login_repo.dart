import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gutty/core/lang/localization_service.dart';
import 'package:gutty/core/network/remote/api_endpoint.dart';
import 'package:gutty/core/network/remote/api_error_handler.dart';
import 'package:gutty/core/network/remote/api_error_model.dart';
import '../model/login_response/login_response_model.dart';

class LoginRepo {
  LoginRepo({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<Either<ApiErrorModel, String>> loginUser(
    Map<String, dynamic> data,
  ) async {
    try {
      final result = await _dio.post(ApiEndpoint.login, data: data);

      
      final token = LoginResponseModel.fromJson(result.data).token;
      if (token != null) {
        return right( token);
      }

      return left(ApiErrorModel(message:  LocalizationService.strings.oppsTryLater ));

      
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 400) {
        return left(ApiErrorModel(message:  LocalizationService.strings.inValidEmailOrPassword ));
      }
      return left(ApiErrorHandler.handle(e));
    }
  }
}
