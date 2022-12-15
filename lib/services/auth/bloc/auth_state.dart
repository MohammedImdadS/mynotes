import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:mdapp/services/auth/auth_user.dart';

@immutable
abstract class AuthState {
  final bool isLoading;
  final String? loadingText;
  const AuthState({
    required this.isLoading,
    this.loadingText = 'Please wait a moment',
  });
}

class AuthStateUninitialized extends AuthState {
  const AuthStateUninitialized({
    required bool isloading,
  }) : super(isLoading: isloading);
}

class AuthStateRegistering extends AuthState {
  final Exception? exception;
  const AuthStateRegistering({
    required this.exception,
    required isloading,
  }) : super(isLoading: isloading);
}

class AuthStateForgotPassword extends AuthState {
  final Exception? exception;
  final bool hasSendEmail;
  const AuthStateForgotPassword({
    required this.exception,
    required this.hasSendEmail,
    required bool isLoading,
  }) : super(isLoading: isLoading);
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;
  const AuthStateLoggedIn({
    required this.user,
    required isloading,
  }) : super(isLoading: isloading);
}

class AuthStateNeedsVerification extends AuthState {
  const AuthStateNeedsVerification({
    required isloading,
  }) : super(isLoading: isloading);
}

class AuthStateLoggedOut extends AuthState with EquatableMixin {
  final Exception? exception;
  const AuthStateLoggedOut({
    required this.exception,
    required isLoading,
    String? loadingText,
  }) : super(
          isLoading: isLoading,
          loadingText: loadingText,
        );

  @override
  List<Object?> get props => [exception, isLoading];
}
