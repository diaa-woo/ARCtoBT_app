import 'package:flutter/material.dart';
import 'package:arctobt_app/backend/session.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hello'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            TextField(
              controller: pwController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password'
              ),
            ),
            ElevatedButton(
              child: const Text('login'),
              onPressed: () async {
                var data = {
                  'id': pwController.text
                };
                final String key = await Session().post('http://192.168.219.108:5000/login', data);
                print(key);
              },
            ),
          ],
        ),
      ),
    );
  }
}