import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/core/network/api_client.dart';
import 'package:flutter_task_manager/core/share_pref/app_share_pref.dart';
import 'package:flutter_task_manager/core/share_pref/app_share_pref_key.dart';
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
  Dio dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.connectTimeout = const Duration(minutes: 3);
          options.receiveTimeout = const Duration(minutes: 3);
          if (bearToken != null) options.headers['Authorization'] = 'Bearer $bearToken';
          handler.next(options);
        },
      ),
    )
    ..interceptors.add(LogInterceptor(request: true, requestBody: true, requestHeader: true, responseBody: true, error: true));
  return dio;
}
