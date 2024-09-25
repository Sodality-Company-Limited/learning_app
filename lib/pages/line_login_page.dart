import 'package:flutter/material.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routers/go_router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LineLoginPage extends StatefulWidget {
  @override
  _LineLoginPageState createState() => _LineLoginPageState();
}

class _LineLoginPageState extends State<LineLoginPage> {
  String _accessToken = '';
  String _displayName = '';
  String _pictureUrl = '';

  @override
  // void initState() {
  //   super.initState();
  //   _checkLoginState();
  // }

  // Future<void> _checkLoginState() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? savedAccessToken = prefs.getString('accessToken');
  //   String? savedDisplayName = prefs.getString('displayName');
  //   String? savedPictureUrl = prefs.getString('pictureUrl');

  //   if (savedAccessToken != null) {
  //     setState(() {
  //       _accessToken = savedAccessToken;
  //       _displayName = savedDisplayName ?? '';
  //       _pictureUrl = savedPictureUrl ?? '';
  //     });
  //   }
  // }

  Future<void> _loginWithLine() async {
    try {
      final result =
          await LineSDK.instance.login(scopes: ["profile", "openid", "email"]);

      // Check if login is successful
      if (result != null && result.accessToken.value.isNotEmpty) {
        // Set state with user profile information
        setState(() {
          _accessToken = result.accessToken.value;
          _displayName = result.userProfile?.displayName ?? '';
          _pictureUrl = result.userProfile?.pictureUrl ?? '';
        });

        // Navigate to the HomePage after successful login
      }
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
