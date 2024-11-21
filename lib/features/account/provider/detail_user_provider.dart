import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task_manager/core/network/provider/network_provider.dart';
import 'package:flutter_task_manager/core/network/response/user/user_response.dart';
import 'package:flutter_task_manager/features/account/provider/usecase/detail_account_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_user_provider.g.dart';


@riverpod
DetailAccountUseCase detailAccountUseCase(Ref ref) {
  final apiClient = ref.read(apiClientPrefProvider);
  final sharePreference = ref.read(appSharePrefProvider);
  return DetailAccountUseCase(
      apiClient: apiClient, sharePreference: sharePreference);
}

@riverpod
Stream<UserResponse?> streamUser(Ref ref) async* {
  final detailAccountUseCase = ref.read(detailAccountUseCaseProvider);
  ref.onDispose(() {
    // Close the connection when the provider is destroyed
  });
  final data = await detailAccountUseCase.execute(null);
  yield data;
}

