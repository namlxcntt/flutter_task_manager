import 'package:flutter_task_manager/core/network/request/login_request.dart';
import 'package:flutter_task_manager/core/network/request/refresh_token_request.dart';
import 'package:flutter_task_manager/core/network/request/tasks/task_request.dart';
import 'package:flutter_task_manager/core/network/response/base_response.dart';
import 'package:flutter_task_manager/core/network/response/login/login_response.dart';
import 'package:flutter_task_manager/core/network/response/tasks/task_response.dart';
import 'package:flutter_task_manager/core/network/response/user/user_response.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: ApiClient.baseURL)
abstract class ApiClient {
  static const String baseURL ="http://localhost:8080/api/";
  static const String apiLogin = "public/login";
  static const String apiRefreshToken = "public/refreshToken";
  static const String apiTask = "tasks/all";
  static const String apiCreateTask = "tasks/create";
  static const String apiGetDetailUser = 'user/detail';

  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(apiLogin)
  Future<ResponseWrapper<LoginResponse>> login(@Body()LoginRequest loginRequest);
  
  @POST(apiRefreshToken)
  Future<ResponseWrapper<LoginResponse>> refreshToken(@Body() RefreshTokenRequest refreshToken);

  @GET(apiTask)
  Future<ResponseWrapper<List<TaskResponse>>> getTasks();
  
  @POST(apiCreateTask)
  Future<ResponseWrapper<TaskResponse>> createTask(@Body() TaskRequest taskRequest);

  @GET(apiGetDetailUser)
  Future<ResponseWrapper<UserResponse>> getDetailUser();
}