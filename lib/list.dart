/*
 * @Author: haifeng_xie haifeng_xie@kingdee.com
 * @Date: 2025-02-12 10:15:56
 * @LastEditors: haifeng_xie haifeng_xie@kingdee.com
 * @LastEditTime: 2025-02-12 18:31:39
 * @FilePath: \helloflutter\lib\my.dart
 * @Description: 路由页——登录
 */

import 'package:flutter/material.dart';

class LoginRoute extends StatefulWidget {
  final String content;
  // const LoginRoute({super.key, required this.content});
  LoginRoute({Key? key, required this.content}) : super(key: key);
  // print(this.content);

  @override
  State<LoginRoute> createState() => _LoginRouteState();
}


class _LoginRouteState extends State<LoginRoute> {
  // const LoginRoute({super.key, required this.content});
  // int _selectedIndex = 1;
  // final String content = 'default1233';

  const _LoginRouteState();

  let String data;
  @override
  void initState() {
    super.initState();
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    data = routeArgs?['data'] ?? '';
  }

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
                Navigator.pop(context, "data <—— 登录页返回参数FED哈哈$content");
              },
              child: const Text('返回我的!'),
            ),
          ),
        ]
      )
    );
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.blue), //自定义图标
            onPressed: () {
              Scaffold.of(context).openDrawer(); // 打开抽屉菜单
            },
          );
        }),
        title: const Text('登录'),
        centerTitle: true,
        elevation: 4.0,
        actions: <Widget>[ //导航栏右侧菜
          IconButton(icon: Icon(Icons.share, color: Colors.blue), onPressed: () {
            print("通常为分享按钮");
          }),
        ],

      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            print("登录页面点击跳转 >>> 我的页面");
            print("「登录页面」接收到「我的页面」路由传入数据: " + content);

            Navigator.pop(context, "data <—— 登录页返回参数FED");
          },
          child: const Text('Go back!'),
        ),
      ),
      drawer: MyDrawer(), //抽屉
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        // onTap: _onItemTapped,
      ),

    );
  }

  // void _onItemTapped() {
  //    _selectedIndex++;
  // }
  //
  // void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/head.jpg",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "哈哈哈哈哈Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}