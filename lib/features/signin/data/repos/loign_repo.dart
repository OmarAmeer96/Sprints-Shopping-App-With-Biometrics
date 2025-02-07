import 'package:sprint_shopping_app_with_bioetrics/core/networking/api_error_handler.dart';
import 'package:sprint_shopping_app_with_bioetrics/core/networking/api_result.dart';
import 'package:sprint_shopping_app_with_bioetrics/core/networking/api_service.dart';
import 'package:sprint_shopping_app_with_bioetrics/features/signin/data/models/login_request_body.dart';
import 'package:sprint_shopping_app_with_bioetrics/features/signin/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiServices;

  LoginRepo(this._apiServices);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiServices.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
