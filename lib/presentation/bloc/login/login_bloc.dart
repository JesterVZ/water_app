import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:water_app/data/entities/login/login_request.dart';
import 'package:water_app/domain/usecases/login/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUsecase usecase;
  LoginBloc({required this.usecase}) : super(const LoginState.initial()) {
    on<Started>((event, emit) {
      emit(const LoginState.initial());
    });
    on<Login>((event, emit) async {
      emit(const LoginState.loading());
      final loginResult = await usecase(event.request);
      loginResult.fold((failure) {
        emit(const LoginState.error("Login error"));
      }, (result) {
        emit(LoginState.login(result));
      });
    });
  }
}
