import 'package:water_app/data/datasource/login/login_remote_datasource.dart';
import 'package:water_app/data/entities/login/login_request.dart';
import 'package:water_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:water_app/domain/repositories/login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource dataSource;
  LoginRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, bool>> login(LoginRequest request) async {
    try {
      final remoteLogin = await dataSource.login(request);
      return Right(remoteLogin);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
