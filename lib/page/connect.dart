import 'package:flutter/material.dart';

class Connect extends StatefulWidget {
  final String loginKey;
  final dynamic paireds;
  const Connect({required this.loginKey, required this.paireds,Key? key}) : super(key: key);

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('연결 페이지'),
          centerTitle: true,
          elevation: 0,
          leading: const IconButton(icon: Icon(Icons.find_replace), onPressed: null,),
        ),
        body: ListView(
          l
        )
      ),
    );
  }
}
