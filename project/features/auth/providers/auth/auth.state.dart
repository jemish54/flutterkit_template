import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.verifying() = AuthStateVerifying;
  const factory AuthState.success() = AuthStateSuccess;
  const factory AuthState.error({
    required String error,
  }) = AuthStateError;
}
