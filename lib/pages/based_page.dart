import 'package:flutter/material.dart';
import 'package:learning_app/pages/dio_page.dart';
import 'package:learning_app/pages/home_page.dart';
import 'package:learning_app/pages/line_login_page.dart';
import 'package:learning_app/pages/post_page.dart';
import 'package:learning_app/pages/event_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const PostPage(),
    LineLoginPage(),
    DioPage()
    // EventGridPage()
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTap(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black,
                  spreadRadius: 5,
                  // blurRadius: 15,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: _onTap,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.assignment), label: 'Post'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_pin), label: 'Line'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.event_note), label: 'Event'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
