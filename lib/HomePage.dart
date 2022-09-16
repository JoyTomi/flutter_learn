// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';

class HomeData {
  HomeData(
      {required this.title, required this.routerName, required this.content});
  final String title;
  final String content;
  final String routerName;
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  final List<HomeData> homeDataList = [
    HomeData(title: 'HomePage', content: 'HomePage', routerName: 'home_page'),
  ];

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter实战教学'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.purple,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: widget.homeDataList.map((HomeData homeData) {
            return HomeListItem(homeData: homeData);
          }).toList(),
        ),
      ),
      // body: ListView(
      //   padding: const EdgeInsets.all(10),
      //   children: widget.homeDataList.map((HomeData homeData) {
      //     return HomeListItem(homeData: homeData);
      //   }).toList(),
      // ),
    );
  }
}

class HomeListItem extends StatefulWidget {
  const HomeListItem({Key? key, required this.homeData}) : super(key: key);
  final HomeData homeData;
  @override
  State<StatefulWidget> createState() {
    return HomeListItemState();
  }
}

class HomeListItemState extends State<HomeListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        // child: FloatingActionButton(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.white.withAlpha(0),
              // margin: const EdgeInsets.only(top: 10),
              // padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: const Image(
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://img2.baidu.com/it/u=1010328615,2032873142&fm=253&fmt=auto&app=120&f=JPEG?w=1200&h=790')),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              // height: 300,
              width: 300,
              color: Colors.white.withAlpha(0),
              // margin: const EdgeInsets.only(top: 10),
              // padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: const Text(
                'text',
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.justify,
                style: TextStyle(
//                backgroundColor: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decorationColor: Colors.black,
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.double,
                  wordSpacing: 1.0,
                  letterSpacing: 0.2,
                  height: 1.5,
                  textBaseline: TextBaseline.ideographic,
                  shadows: [
                    Shadow(
                        blurRadius: 10,
                        offset: Offset(0.5, 0.5),
                        color: Colors.red)
                  ],
                ),
              ),
            ),
            IconButton(
              color: Colors.green,
              padding: EdgeInsets.zero,
              alignment: Alignment.topCenter,
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 24,
              ),
              onPressed: () {
                log('123');
                Navigator.pushNamed(context, widget.homeData.routerName);
              },
            ),
          ],
        )
        // onPressed: () {
        //   // ignore: avoid_print
        //   print(widget.homeData.title);
        //   if (widget.homeData.routerName.isNotEmpty) {
        //     Navigator.pushNamed(context, widget.homeData.routerName);
        //   }
        // },
        // ),
        );
  }
}
