import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/core/network/api_client.dart';
import 'package:flutter_task_manager/core/network/request/login_request.dart';
import 'package:flutter_task_manager/core/share_pref/app_share_pref.dart';
import 'package:flutter_task_manager/core/share_pref/app_share_pref_key.dart';
import 'package:flutter_task_manager/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'network_provider.g.dart';

@Riverpod(keepAlive: true)
AppSharePreference appSharePref(Ref ref) {
  return throw UnimplementedError();
}

@Riverpod(keepAlive: true)
ApiClient apiClientPref(Ref ref) {
  final dio = ref.read(dioPrefProvider);
  return ApiClient(dio);
}

@Riverpod(keepAlive: true)
Dio dioPref(Ref ref) {
  final appSharePref = ref.read(appSharePrefProvider);
  var bearToken = appSharePref.getString(key: AppSharePrefKey.tokenUser);

  Future<void> refreshToken() async {
    final apiClient = ref.read(apiClientPrefProvider);
    final refreshToken =
        appSharePref.getString(key: AppSharePrefKey.refreshToken) ?? '';
    final apiResponse = await apiClient.refreshToken(refreshToken);
    if (apiResponse.status == 200 && apiResponse.data != null) {
      await appSharePref.saveString(
          key: AppSharePrefKey.tokenUser,
          value: apiResponse.data!.bearToken ?? '');
      await appSharePref.saveString(
          key: AppSharePrefKey.refreshToken,
          value: apiResponse.data!.refreshToken ?? '');
    }
  }

  final Dio dio = Dio();
  dio
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.connectTimeout = const Duration(minutes: 3);
          options.receiveTimeout = const Duration(minutes: 3);
          if (bearToken != null || bearToken?.isNotEmpty == true) {
            options.headers['Authorization'] = 'Bearer $bearToken';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 403) {
            try {
              await refreshToken();
              final requestOptions = error.requestOptions;
              var newToken =
                  appSharePref.getString(key: AppSharePrefKey.tokenUser);
              requestOptions.headers['Authorization'] = 'Bearer $newToken';
              final retryResponse = await dio.request(
                requestOptions.path,
                options: Options(
                  method: requestOptions.method,
                  headers: requestOptions.headers,
                ),
                data: requestOptions.data,
                queryParameters: requestOptions.queryParameters,
              );
              return handler.resolve(retryResponse);
            } catch (exception) {
              LogUtils.getInstance.d("RefreshToken Error ->$exception");
              return handler.reject(error);
            }
          } else {
            return handler.next(error);
          }
        },
      ),
    )
    ..interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        error: true));
  return dio;
}
