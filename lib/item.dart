import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  final String myParam;
  // const LoginRoute({super.key, required this.content});
  const ItemWidget({Key? key, required this.myParam}) : super(key: key);
  // print(this.content);

  @override
  _ItemWidgetState createState() => _ItemWidgetState(myParam);
}

class _ItemWidgetState extends State<ItemWidget> {
  final String myParam;
  _ItemWidgetState(this.myParam);

  // late String data = "default-Data";
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical, // 默认值，从上到下
      children: <Widget> [
        Row(
          children: <Widget>[
          Text('Parameter: --$myParam--'),
          SizedBox(width: 30),
          Text('我是默认文字'),
          ],
        ),
        Container(color: Colors.red, height: 50.0,),
        Container(color: Colors.green, height: 50.0,),
        Row(
          children: <Widget>[
            const Text('DDDDDD'),
          ],
        )
      ],
    );



  }

}