// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MSCustomNotification extends Notification {
  MSCustomNotification(this.msg);
  final String msg;
}

class MSNotificationDemo3 extends StatefulWidget {
  const MSNotificationDemo3({Key? key}) : super(key: key);

  @override
  State<MSNotificationDemo3> createState() => _MSNotificationDemo3State();
}

class _MSNotificationDemo3State extends State<MSNotificationDemo3> {
  String _msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NotificationDemo3")),
      // 监听指定通知 MSCustomNotification
      body: NotificationListener<MSCustomNotification>(
        onNotification: (notification) {
          _msg += notification.msg;
          setState(() {});
          return true; // 阻止冒泡
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 不能这样写
              // 此处context是根Context，而NotificationListener监听的是子Widget
              // ElevatedButton(
              //   onPressed: () => MSCustomNotification("Hi").dispatch(context),
              //   child: Text("Send Notification"),
              // ),
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      // 分发通知
                      MSCustomNotification("Hi ").dispatch(context);
                    },
                    child: const Text("Send Notification"),
                  );
                },
              ),
              Text(
                _msg,
                textScaleFactor: 1.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class NotificationRouteState extends State<NotificationRoute> {
//   String _msg="";
//   @override
//   Widget build(BuildContext context) {
//     //监听通知
//     return NotificationListener< MSCustomNotification >(
//       onNotification: (notification){
//         print(notification.msg); //打印通知
//         return false;
//       },
//       child: NotificationListener< MSCustomNotification >(
//         onNotification: (notification) {
//           setState(() {
//             _msg+=notification.msg+"  ";
//           });
//           return false; 
//         },
//         child: ...//省略重复代码
//       ),
//     );
//   }
// }