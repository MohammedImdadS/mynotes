import 'package:mdapp/services/auth/auth_provider.dart';
import 'package:mdapp/services/auth/auth_user.dart';

class AuthService implements AuthProvider {
  final AuthService provider;
  const AuthService(this.provider);

  @override
  Future<AuthUser> creatUser({
    required String email,
    required String password,
  }) =>
      provider.creatUser(
        email: email,
        password: password,
      );

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<AuthUser> login({
    required String email,
    required String password,
  }) => provider.login(email: email, password: password,);

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();
}
