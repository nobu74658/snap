import 'package:flutter/material.dart';
import 'package:snap/view/screens/pages/about_us_page.dart';
import 'package:snap/view/screens/pages/head_line_page.dart';
import 'package:snap/view/screens/pages/work_list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _pages = [
    HeadLinePage(),
    WorkListPage(),
    AboutUsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: _pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.highlight),
              label: 'トップ',),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list),
              label: '一覧',),
              BottomNavigationBarItem(icon: Icon(Icons.info),
              label: 'このアプリについて',),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              },);
            },
          ),
        ));
  }
}
