/*
 * @Author: haifeng_xie haifeng_xie@kingdee.com
 * @Date: 2025-02-12 10:15:56
 * @LastEditors: haifeng_xie haifeng_xie@kingdee.com
 * @LastEditTime: 2025-02-12 13:46:01
 * @FilePath: \helloflutter\lib\my.dart
 * @Description: 路由页——我的
 */


import 'package:flutter/material.dart';
import 'package:helloflutter/login.dart';

class MyRoute extends StatelessWidget {
  const MyRoute({super.key, required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
        centerTitle: true,

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('返回主页!'),
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed:  () async {
                  print("「My」接收到「Home」路由传入数据: " + content);
                  print("「My」点击跳转 >>> 「Login」");

                  String info = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginRoute(
                          content: "data ——> 我的页携带参数DEF"
                        ),
                        settings: RouteSettings(
                            name: '/login',
                            arguments: {'data': 'some data to Widget'}
                        )
                    ),
                  );
                  print("「我的页面」接收到「登录页面」路由返回数据: " + info);
                },
                child: const Text('跳转登录!'),
            )
          )
        ]
      )

    );
  }
}

