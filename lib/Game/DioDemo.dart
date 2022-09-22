// ignore_for_file: file_names, depend_on_referenced_packages
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioDemoView extends StatefulWidget {
  const DioDemoView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DioDemoViewState();
  }
}

class DioDemoViewState extends State<DioDemoView> {
  void test() {
    log('test');
    DioUtil().sendRequest(DioMethod.get, (response) {
      log(response.data.toString());
    }, (error) {
      log(error.toString());
    }, null);
  }

  @override
  Widget build(Object context) {
    return InkWell(
        onTap: () => test(),
        child: Center(
            child: Container(
          width: 100,
          height: 100,
          color: Colors.lightBlue,
        )));
  }
}

// ----------------------------------------------------------------------------------------------------//
typedef DioSuccessCallBack = void Function(Response response);

typedef DioFailCallBack = void Function(DioError error);

enum DioMethod {
  get,
  post,
  put,
  delete;

  String string() {
    // return '';
    switch (this) {
      case DioMethod.get:
        return 'get';
      case DioMethod.post:
        return 'post';
      case DioMethod.put:
        return 'put';
      case DioMethod.delete:
        return 'delete';
      default:
        return 'get';
    }
  }
}

///类
class DioUtil {
  var dio = Dio();

  // 工厂方法构造函数
  factory DioUtil() => _getInstance();

  // instance的getter方法，DioUtil.instance获取对象
  static DioUtil get instance => _getInstance();

  // 静态变量_instance，存储唯一对象
  static DioUtil? _instance;

  // 获取对象
  static DioUtil _getInstance() {
    return _instance ??= DioUtil._internal();
  }

  // 私有的命名式构造方法，通过它实现一个类 可以有多个构造函数，
  // 子类不能继承internal
  // 不是关键字，可定义其他名字
  DioUtil._internal() {
    config();
  }

  void config() {
    log('config');
    dio.options.baseUrl = 'https://master-api.test.miaoxiang.co';
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;
  }

  void sendRequest(DioMethod method, DioSuccessCallBack success,
      DioFailCallBack fail, Map<String, dynamic>? param) {
    var requestOptions = RequestOptions(
        method: method.string(),
        path: '${dio.options.baseUrl}/api/index_datsa',
        queryParameters: param);

    requestOptions.validateStatus = (status) {
      log(status.toString());
      return true; //status == 200;
    };

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      success(response);
      return handler.next(response);
    }, onError: (DioError e, handler) {
      fail(e);
      return handler.next(e);
    }));

    dio.fetch(requestOptions);
  }

  ///方法
  void setGoBack() {
    log("object");
  }
}
