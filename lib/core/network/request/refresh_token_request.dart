import 'package:freezed_annotation/freezed_annotation.dart';
part 'refresh_token_request.g.dart';

@JsonSerializable()
class RefreshTokenRequest {
  final String? refreshToken;
  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) => _$RefreshTokenRequestFromJson(json);

  RefreshTokenRequest(this.refreshToken);
  Map<String, dynamic> toJson() => _$RefreshTokenRequestToJson(this);
}