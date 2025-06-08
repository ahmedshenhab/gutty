import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gutty/core/network/remote/api_endpoint.dart';
import 'package:gutty/core/network/remote/api_error_handler.dart';
import 'package:gutty/core/network/remote/api_error_model.dart';
import 'package:gutty/module/layout_screen/widget/menu/data/model/meal_menu_model.dart';

class RepoMenu {
  RepoMenu({required Dio dio}) : _dio = dio;
  final Dio _dio;

  Future<Either<ApiErrorModel, List<MealMenuModel>>> searchByName(
    String name,
  ) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoint.baseUrl}${ApiEndpoint.searchByname}?SearchText=$name',
      );
      final List<MealMenuModel> meals = MealMenuModel.fromJsonList(response.data);
      return right(meals);


      
    } catch (e) {
      return left(ApiErrorHandler.handle(e));
    }
  }
}
