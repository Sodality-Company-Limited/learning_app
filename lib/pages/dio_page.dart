import 'package:flutter/material.dart';
import '../api/base.dart';

class DioPage extends StatefulWidget {
  @override
  _DioPageState createState() => _DioPageState();
}

class _DioPageState extends State<DioPage> {
  ApiService apiService = ApiService();
  String data = '';
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      print('Fetching data...');
      final response = await apiService
          .fetchData('https://jsonplaceholder.typicode.com/todos/1');
      print('Response received: $response');

      if (!mounted) return;

      if (response != null && response.data != null) {
        setState(() {
          data = response.data.toString();
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to fetch data';
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
        errorMessage = 'An error occurred: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dio + DioHive Example')),
      body: Center(
        child: errorMessage.isNotEmpty
            ? Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              )
            : Text(data.isEmpty ? 'No data available' : data),
      ),
    );
  }
}
