// ignore_for_file: file_names
import 'package:flutter/material.dart';

class HomeDesign extends StatefulWidget {
  const HomeDesign({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeDesignState();
  }
}

class HomeDesignState extends State<HomeDesign> {
  @override
  Widget build(Object context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Column(children: [
        Container(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurStyle: BlurStyle.normal,
                    offset: Offset(2, 2),
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 4)
              ],
            ),
            height: 84.0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ["1", "2", "3", "4"]
                    .map((e) => Container(
                        width: 64,
                        height: 64,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.mail,
                              size: 30,
                            ),
                            Container(
                              height: 8,
                              color: Colors.white,
                            ),
                            Text(
                              e,
                              style: const TextStyle(
                                  color: Colors.black,
                                  backgroundColor: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.left,
                            )
                          ],
                        )))
                    .toList())),
        SizedBox(
          height: constraints.maxHeight - 114,
          child: ListView(
            itemExtent: 100,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: Colors.primaries
                .map((e) => Container(height: 100, color: e))
                .toList(),
          ),
        )
      ]);
    }));
  }
}
