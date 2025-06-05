import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gutty/core/lang/localization_service.dart';
import 'package:gutty/core/network/remote/api_endpoint.dart';
import 'package:gutty/core/network/remote/api_error_handler.dart';
import 'package:gutty/core/network/remote/api_error_model.dart';
import 'package:gutty/module/auth/register/data/model/register_response_model.dart';

class RegisterRepo {
  RegisterRepo({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<Either<ApiErrorModel, String>> registerUser(
    Map<String, dynamic> data,
  ) async {
    try {
      final result = await _dio.post(ApiEndpoint.register, data: data);
      final token = RegisterResponseModel.fromJson(result.data).token;
      if (token != null) {
        return right(token);
        
      }

      return left(ApiErrorModel(message: LocalizationService.strings.oppsTryLater ));
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 400) {
        final errorList = e.response?.data;

        final errorMessage =
            errorList.isNotEmpty
                ? errorList[0]['description'] ?? 'Something went wrong'
                : 'Something went wrong';

        return left(ApiErrorModel(message: errorMessage));
      }

      return left(ApiErrorHandler.handle(e));
    }
  }
}
