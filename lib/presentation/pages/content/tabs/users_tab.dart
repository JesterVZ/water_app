import 'package:flutter/material.dart';

class UsersTab extends StatefulWidget {
  const UsersTab({super.key});

  @override
  State<StatefulWidget> createState() => _UsersTabState();
}

class _UsersTabState extends State<UsersTab> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text("Users Tab"),
        ),
      );
}
