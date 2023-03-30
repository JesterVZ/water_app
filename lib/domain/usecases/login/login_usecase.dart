import 'package:water_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:water_app/core/usecase/usecase.dart';
import 'package:water_app/data/entities/login/login_request.dart';
import 'package:water_app/domain/repositories/login/login_repository.dart';

class LoginUsecase implements UseCase<bool, LoginRequest> {
  final LoginRepository repository;
  LoginUsecase(this.repository);
  @override
  Future<Either<Failure, bool>> call(LoginRequest request) async {
    return await repository.login(request);
  }
}
