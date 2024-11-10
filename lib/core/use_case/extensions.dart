import 'package:dio/dio.dart';

typedef CaptureDioRecord<T> = ({T? data, NetworkErrorState? error});

enum ErrorType { unknow, network, timeout, server }
class NetworkErrorState {
  final String message;
  final ErrorType errorType;
  final int? errorCode;
  NetworkErrorState(this.message, this.errorType, {this.errorCode});
}

Future<CaptureDioRecord<T>> callAndCaptureError<T>(
    Future<T> Function() apiCall) async {
  try {
    final response = await apiCall();
    return (data: response, error: null);
  } on DioException catch (dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return (
          data: null,
          error: NetworkErrorState('Request timed out', ErrorType.timeout,errorCode: dioException.response?.statusCode)
        );
      case DioExceptionType.badResponse:
        return (
          data: null,
          error: NetworkErrorState(
              'Server error: ${dioException.response?.statusCode}',
              ErrorType.server,errorCode: dioException.response?.statusCode)
        );
      case DioExceptionType.cancel:
        return (
          data: null,
          error: NetworkErrorState('Request canceled', ErrorType.unknow,errorCode: dioException.response?.statusCode)
        );
      case DioExceptionType.unknown:
      default:
        return (
          data: null,
          error: NetworkErrorState('Network error', ErrorType.network)
        );
    }
  } catch (e) {
    return (
      data: null,
      error: NetworkErrorState(e.toString(), ErrorType.unknow)
    );
  }
}
