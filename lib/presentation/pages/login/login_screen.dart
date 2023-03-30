import 'package:flutter/material.dart';
import 'package:water_app/data/entities/login/login_request.dart';
import 'package:water_app/internal/injection_container.dart';
import 'package:water_app/presentation/bloc/login/login_bloc.dart';
import 'package:water_app/presentation/ui/app_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final bloc = locator<LoginBloc>();
  bool loading = false;

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (context) => bloc, child: Scaffold(body: _buildContent(context)));

  Widget _buildContent(BuildContext context) => Stack(
        children: [
          Padding(
            padding: AppUI.formPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 44),
                  child: Text(
                    '-=MSD1=-',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                _buildForm(context)
              ],
            ),
          )
        ],
      );
  Widget _buildForm(BuildContext context) => Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: loginController,
            decoration: const InputDecoration(hintText: "Логин"),
          ),
          AppUI.appSpacing1,
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: "Пароль"),
            obscureText: true,
          ),
          AppUI.appSpacing2,
          _buildButton(context)
        ],
      ));

  Widget _buildButton(BuildContext context) => SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 52,
      child: ElevatedButton(
          onPressed: () => _login(),
          child: const Text(
            "Войти",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )));
  _login() {
    final request = LoginRequest(
        login: loginController.text, password: passwordController.text);
    bloc.add(Login(request: request));
  }
}
