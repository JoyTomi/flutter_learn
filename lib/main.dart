import 'package:flutter/material.dart';
import 'Home/HomePage.dart';
import 'Home/HomeView.dart';
import 'Game/NotificationDemo.dart';
import 'Game/GetDemo.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'Game/DioDemo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routerTable = {
    'home_page': (context) => HomePage(),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          splashColor: Colors.transparent, highlightColor: Colors.transparent),
      //注册路由表
      routes: routerTable,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<BottomNavigationBarItem> _bottomTabs = [
    BottomNavigationBarItem(
        icon: Image.asset(
          "images/tab_home.png",
          fit: BoxFit.contain,
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          "images/tab_home_selected.png",
          fit: BoxFit.contain,
          width: 24,
          height: 24,
        ),
        label: '首页'),
    BottomNavigationBarItem(
        icon: Image.asset(
          "images/tab_two.png",
          fit: BoxFit.contain,
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          "images/tab_two_selected.png",
          fit: BoxFit.contain,
          width: 24,
          height: 24,
        ),
        label: '游戏'),
    BottomNavigationBarItem(
        icon: Image.asset(
          "images/tab_three.png",
          fit: BoxFit.contain,
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          "images/tab_three_selected.png",
          fit: BoxFit.contain,
          width: 24,
          height: 24,
        ),
        label: '发现'),
    BottomNavigationBarItem(
        icon: Image.asset(
          "images/tab_four.png",
          fit: BoxFit.contain,
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          "images/tab_four_selected.png",
          fit: BoxFit.contain,
          width: 24,
          height: 24,
        ),
        label: '我的')
  ];

  final List _tabs = [
    HomeView(),
    const MSNotificationDemo3(),
    const Home(),
    const DioDemoView(),
  ];

  var currentIndex = 0;
  Widget? currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = _tabs[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: currentPage,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: _bottomTabs,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              currentPage = _tabs[currentIndex];
            });
          },
          fixedColor: Colors.black,
        ));
  }
}
