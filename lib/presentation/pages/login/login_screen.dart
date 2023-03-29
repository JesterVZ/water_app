import 'package:flutter/material.dart';
import 'package:water_app/presentation/ui/app_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(body: _buildContent(context));

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
          onPressed: () {},
          child: const Text(
            "Войти",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )));
}
