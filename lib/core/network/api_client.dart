import 'package:flutter_task_manager/core/network/request/login_request.dart';
import 'package:flutter_task_manager/core/network/response/base_response.dart';
import 'package:flutter_task_manager/core/network/response/login/login_response.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: ApiClient.baseURL)
abstract class ApiClient {
  static const String baseURL ="http://localhost:8080/";
  static const String apiLogin = "api/public/login";

  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(apiLogin)
  Future<ResponseWrapper<LoginResponse>> login(@Body()LoginRequest loginRequest);

}