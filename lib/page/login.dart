import 'package:arctobt_app/page/connect.dart';
import 'package:flutter/material.dart';
import 'package:arctobt_app/backend/session.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                final String key = await Session().post(url: 'http://192.168.219.104:5000/login', data: data);
                if(context.mounted) {
                  if (key == '?') {
                    showToast();
                  }
                  else {
                    data = {
                      'key': key
                    };
                    final dynamic paireds = await Session().post(url: 'http://192.168.219.104:5000/paired', data: data, status: true);
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Connect(loginKey: key, paireds: paireds,)), (route) => false);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

void showToast() {
  Fluttertoast.showToast(
    msg: '패스워드가 잘못된!',
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT
  );
}