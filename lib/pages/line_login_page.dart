import 'package:flutter/material.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

class LineLoginPage extends StatefulWidget {
  @override
  _LineLoginPageState createState() => _LineLoginPageState();
}

class _LineLoginPageState extends State<LineLoginPage> {
  String _accessToken = '';
  String _displayName = '';
  String _pictureUrl = '';

  Future<void> _loginWithLine() async {
    try {
      final result =
          await LineSDK.instance.login(scopes: ["profile", "openid", "email"]);
      print("Login Successful: ${result.userProfile?.displayName}");

      setState(() {
        _accessToken = result.accessToken.value;
        _displayName = result.userProfile?.displayName ?? '';
        _pictureUrl = result.userProfile?.pictureUrl ?? '';
      });
    } catch (e) {
      print("Error during LINE login: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LINE Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _loginWithLine,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 12, 180, 18),
                foregroundColor: Colors.white,
              ),
              child: Text('Login with LINE'),
            ),
            if (_displayName.isNotEmpty)
              Column(
                children: [
                  Text('Hello, $_displayName'),
                  if (_pictureUrl.isNotEmpty) Image.network(_pictureUrl),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
