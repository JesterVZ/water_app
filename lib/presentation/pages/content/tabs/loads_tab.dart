import 'package:flutter/material.dart';

class LoadsTab extends StatefulWidget {
  const LoadsTab({super.key});

  @override
  State<StatefulWidget> createState() => _LoadsTabState();
}

class _LoadsTabState extends State<LoadsTab> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text("Loads Tab"),
        ),
      );
}
