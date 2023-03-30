import 'package:flutter/material.dart';
import 'package:water_app/presentation/pages/content/main_page.dart';
import 'package:water_app/internal/injection_container.dart' as di;
import 'package:water_app/presentation/ui/app_colors.dart';
import 'package:water_app/presentation/ui/app_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.startup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water App',
      theme: ThemeData(
          primarySwatch: AppColors.appcolors,
          inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.grayColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.appcolors),
              )),
          textTheme: Theme.of(context).textTheme.copyWith(
              headlineMedium: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.appcolors[400])),
          buttonTheme: ButtonThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppUI.borderRadius))),
          bottomAppBarTheme:
              BottomAppBarTheme(color: AppColors.appcolors[400])),
      home: const MainPage(),
    );
  }
}
