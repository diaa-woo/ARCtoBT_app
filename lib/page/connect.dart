import 'package:flutter/material.dart';

class Connect extends StatefulWidget {
  final String loginKey;
  const Connect({required this.loginKey, Key? key}) : super(key: key);

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text("Connect Page!"),
      ),
    );
  }
}
