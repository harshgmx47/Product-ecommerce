import 'package:ecom/features/auth/RemoteServices/remoteDataSource.dart';
import 'package:ecom/utils/apiUtils.dart';

class AuthRepository {
  static final AuthRepository _instance = AuthRepository._internal();
  late AuthRemoteDataSource _authRemoteDataSource;

  factory AuthRepository() {
    _instance._authRemoteDataSource = AuthRemoteDataSource();
    return _instance;
  }

  AuthRepository._internal();

  Future<void> register(
      String email, String password, String name, String avatar) async {
    await _authRemoteDataSource.register(email, password,
        name: name, avatar: avatar);
  }

  Future<void> login(String email, String password) async {
    await _authRemoteDataSource.login(
      email,
      password,
    );
  }

  Future<void> logout() async {
    APIUtils.clearToken();
  }
}
