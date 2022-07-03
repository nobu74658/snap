import 'package:flutter/material.dart';
import 'package:snap/view/screens/pages/about_us_page.dart';
import 'package:snap/view/screens/pages/head_line_page.dart';
import 'package:snap/view/screens/pages/post_page.dart';
import 'package:snap/view/screens/pages/work_list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Widget> _pages;
  int _currentIndex = 0;

  @override
  void initState(){
    _pages = [
      HeadLinePage(),
      WorkListPage(),
      PostPage(),
      AboutUsPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.highlight,
              ),
              label: 'トップ',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.list,),
              label: '一覧',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.post_add,),
              label: '投稿',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.info,),
              label: 'アプリについて',
            ),
          ],
          onTap: (index) {
            setState(
              () {
                _currentIndex = index;
              },
            );
          },
        ),
      ),
    );
  }
}
