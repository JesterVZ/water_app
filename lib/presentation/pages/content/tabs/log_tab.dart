import 'package:flutter/material.dart';

class LogTab extends StatefulWidget {
  const LogTab({super.key});

  @override
  State<StatefulWidget> createState() => _LogTabState();
}

class _LogTabState extends State<LogTab> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text("Log Tab"),
        ),
      );
}
