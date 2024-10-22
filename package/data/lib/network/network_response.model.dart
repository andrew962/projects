import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_response.model.freezed.dart';

@freezed
class NetworkResponse<T> with _$NetworkResponse {
  const factory NetworkResponse.ok(T data) = Ok;
  const factory NetworkResponse.err(String err) = Err;
}
