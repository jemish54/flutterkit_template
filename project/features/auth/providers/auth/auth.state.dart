import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthStateInitial;
  const factory AuthState.loading() = _AuthStateLoading;
  const factory AuthState.verifying() = _AuthStateVerifying;
  const factory AuthState.success() = _AuthStateSuccess;
  const factory AuthState.error({
    required String error,
  }) = _AuthStateError;
}
