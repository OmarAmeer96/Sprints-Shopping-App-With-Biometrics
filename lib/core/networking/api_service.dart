import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sprint_shopping_app_with_bioetrics/core/networking/api_constants.dart';
import 'package:sprint_shopping_app_with_bioetrics/features/signin/data/models/login_request_body.dart';
import 'package:sprint_shopping_app_with_bioetrics/features/signin/data/models/login_response.dart';
import 'package:sprint_shopping_app_with_bioetrics/features/signup/data/models/signup_request_body.dart';
import 'package:sprint_shopping_app_with_bioetrics/features/signup/data/models/signup_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );
}
