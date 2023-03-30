import 'package:flutter/material.dart';

class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<StatefulWidget> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text("Main Tab"),
        ),
      );
}
