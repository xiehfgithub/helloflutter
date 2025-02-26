/*
 * @Author: haifeng_xie haifeng_xie@kingdee.com
 * @Date: 2025-02-12 10:15:56
 * @LastEditors: haifeng_xie haifeng_xie@kingdee.com
 * @LastEditTime: 2025-02-26 10:57:22
 * @FilePath: \helloflutter\lib\my.dart
 * @Description: 路由页——我的
 */



import 'package:flutter/material.dart';
import 'package:helloflutter/login.dart';

// import 'package:provider/provider.dart';

/*网络请求*/
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

int aNum = 1;
class MyRoute extends StatefulWidget {
  final String content;
  const MyRoute({super.key, required this.content});


  @override
  State<MyRoute> createState() {
    return _MyRouteState(content);
  }
}

class _MyRouteState extends State<MyRoute> {
// class MyRoute extends StatelessWidget {
  final String content;
  _MyRouteState(this.content);
  late Future<Album>? _futureAlbum = null;
  late Future<String>? _futureAlbumStr = null;
  late Future<Album>? _futureAlbumAuto = fetchAlbum();
  late String respStr = 'defaultRequestString';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
        centerTitle: true,
        backgroundColor: Colors.brown,
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
                            arguments: {'data': 'some data to Widget'}
                        )
                    ),
                  );
                  print("「我的页面」接收到「登录页面」路由返回数据: " + info);
                },
                child: const Text('跳转登录!'),
            )
          ),
          SizedBox(height: 40,),
          Center(
            child: FutureBuilder<Album>(
              future: _futureAlbumAuto,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  respStr = jsonEncode(snapshot.data?.title);
                  return Text("请求结果: $respStr");
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
          SizedBox(height: 40,),
          // (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
          buildColumn(),

          Center(
            child: FutureBuilder<String>(
              future: _futureAlbumStr,
              builder: (context, snapshot) {
                print("组件获取函数返回: ${(snapshot.data)}");

                if (snapshot.hasData) {
                  // respStr = jsonEncode(snapshot.data?.title);
                  return Text("更新后值:\n ${snapshot.data}");
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),

        ]
      )

    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 300,
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: 'Enter Title'),
          ),
        ),
        SizedBox(height: 40,),
        ElevatedButton(
          onPressed: () {
            setState(() {
              // _futureAlbum = createAlbum(_controller.text);
              _futureAlbumStr = updateAlbum(_controller.text) as Future<String>?;
            });
          },
          child: const Text('更新请求结果'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  FutureBuilder<String> buildFutureBuilderStr() {
    return FutureBuilder<String>(
      future: _futureAlbumStr,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data as String);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

/*
* 网络请求
* */
class Album {
  final int userId;
  final int id;
  final String title;

  const Album({this.userId = 8888, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    print(json);
    return switch (json) {
      {'id': int id, 'title': String title} => Album(
        id: id,
        title: title,
      ),
      _ => throw const FormatException('Failed to load album1.'),
    };
  }

}

Future<Album> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album2');
  }
}

Future<Album> createAlbum(String title) async {
  print("主动请求携带参数$title");
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'title': title}),
  );
  print("主动请求返回");
  print(response.body);
  if (response.statusCode == 201) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to create album.');
  }
}

Future<String> updateAlbum(String title) async {
  aNum++;
  final reqStr = (title + aNum.toString());
  print("获取组件内传递过来的参数: $reqStr");
  final response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'title': reqStr}),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print("请求函数返回: ${response.body}");
    return response.body;
    // return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}