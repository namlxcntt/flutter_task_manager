import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef WidgetBuilderData<T> = Widget Function(T value);
typedef WidgetBuilderLoading<T> = Widget Function();
typedef WidgetBuilderError<T> = Widget Function(Object error, StackTrace stackTrace);

class AsyncWidget<T> extends StatelessWidget {
  final AsyncValue<T> asyncValue;
  final WidgetBuilderData<T> builderData;
  final WidgetBuilderLoading<T>? builderLoading;
  final WidgetBuilderError<T>? builderError;

  const AsyncWidget({
    super.key,
    required this.asyncValue,
    required this.builderData,
    this.builderLoading,
    this.builderError,
  });

  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
      data: (data) => builderData(data),
      error: (err, stack) => builderError?.call(err,stack) ?? const SizedBox(),
      loading: () => builderLoading?.call() ?? const SizedBox(),
    );
  }
}
