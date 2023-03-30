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
      // TODO: implement event handler
    });
    on<Login>((event, emit) {
      // TODO: implement event handler
    });
  }
}
