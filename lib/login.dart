/*
 * @Author: haifeng_xie haifeng_xie@kingdee.com
 * @Date: 2025-02-12 10:15:56
 * @LastEditors: haifeng_xie haifeng_xie@kingdee.com
 * @LastEditTime: 2025-02-12 18:49:30
 * @FilePath: \helloflutter\lib\my.dart
 * @Description: 路由页——我的
 */


import 'package:flutter/material.dart';
import 'package:helloflutter/item.dart';

class LoginRoute extends StatelessWidget {
  final String content;
  const LoginRoute({super.key, required this.content});

  String get s => "“默认”";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ElevatedButton(
                onPressed: () {
                  print("「Login」点击跳转 >>> 「My」");
                  print("「Login」接收到「My」路由传入数据: " + content);
                  Navigator.pop(context, "data <—— 「My」返回参数FED");
                  
                },
              // child: const Text('返回我的页面 !'),
              child: const ItemWidget(myParam: "myParam参数"),
              ),
            
          ),
          // Center(
          //   child: ElevatedButton(
          //     onPressed:  () async {
          //       print("「我的页面」接收到「主页面」路由传入数据: " + content);
          //       print("我的页面点击跳转 >>> 登录页面");

          //       String info = await Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => LoginRoute(
          //               content: "data ——> 我的页携带参数DEF"
          //             ),
          //             settings: RouteSettings(
          //                 name: '/login',
          //                 arguments: {'data': 'some data to Widget'}
          //             )
          //         ),
          //       );
          //        print("「我的页面」接收到「登录页面」路由返回数据: " + info);
          //     },
          //     child: const Text('跳转登录!'),
          //   )
          // )
          /*Center(
            child: ItemWidget(myParam: "myParam参数"),
          )*/

        ]
      )

    );
  }
}

