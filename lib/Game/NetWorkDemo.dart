// ignore_for_file: file_names

// import 'dart:convert';
//难搞 错误拦截文档没写
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class NetWorkView extends StatefulWidget {
  const NetWorkView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NetWorkViewState();
  }
}

class NetWorkViewState extends State<NetWorkView> {
  // var client = http.Client();
  Future<void> test3() async {
    var url = Uri.https('master-api.test.miaoxianga.co', '/api/index_data');
    var response = await http.get(url);

    log('${response.statusCode}');
    log(response.body.toString());
  }

  void test4() async {
    var client = http.Client();

    try {
      var response = await client
          .get(Uri.https('master-api.test.miaoxianga.co', '/api/index_data'));
      // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      // var uri = Uri.parse(decodedResponse['uri'] as String);
      // log(client.get(uri).toString());
      // log(decodedResponse.toString());

      log(response.body.toString());
    } catch (e) {
      log(e.toString());
    } finally {
      client.close();
    }
  }

  void test() async {
    var requset = http.Request(
        'get', Uri.https('master-api.test.miaoxianga.co', '/api/index_data'));
    // var response = requset.send();
    UserAgentClient('asd', http.Client())
        .send(requset)
        .then((value) => log(value.toString()))
        .catchError((e) {
      log(e.toString());
    });

    // UserAgentClient('asd', http.Client()).send(requset).then((value) {
    //   log(value.statusCode.toString());
    //   log(value.request!.headers.toString());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        test();
      },
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
      ),
    );
  }
}

class UserAgentClient extends http.BaseClient {
  final String userAgent;
  final http.Client _inner;

  UserAgentClient(this.userAgent, this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['user-agent'] = userAgent;
    return _inner.send(request).catchError((onError) {
      return onError();
    });
  }
}
