import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  final String myParam;
  const ItemWidget({super.key, required this.myParam});

  @override
  State createState() => _ItemWidgetState(myParam);
}

class _ItemWidgetState extends State<ItemWidget> {
  final String myParam;
  _ItemWidgetState(this.myParam);

  int _count = 0;
  int _countCat = 0;

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
        Container(color: Colors.red, height: 10.0,),
        Row(
          textDirection: TextDirection.rtl,
          children: <Widget>[
            const Text('some string'),
          ],
        ),
        GestureDetector(
          onTap: () {
            // 点击图片时的操作
            print("图片被点击了！");
            setState(() => _countCat++);
          },
          child: Image.network(
            'https://img2.baidu.com/it/u=3569938955,3807849304&fm=253&fmt=auto&app=120&f=JPEG?w=1085&h=800',
            height: 200, // 图片高度
          ),
        ),
        // Image.asset('assets/images/head.jpg',height: 100,),
        Container(
          color: Colors.blue,
          // height: 280,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 2),
            ),
            width: 260,
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 50),
                    Image.asset('assets/images/head.jpg',height: 100,),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  '小猫点击—— $_countCat ——次',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            )
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () => setState(() => _count++),
                tooltip: 'Increment Counter',
                heroTag: "1111",
                child: const Icon(Icons.add),
              ),
              Text('数值：$_count ',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.redAccent,
                ),
              ),
              FloatingActionButton(
                onPressed: () => setState(() => _count--),
                tooltip: 'Increment Counter',
                heroTag: "2222",
                child: Text("—"),
              ),
            ]
        ),
        Container(
          height: 40,
          color: Color.fromRGBO(177, 172, 86, 1),
          child: const Align(
            alignment: Alignment.bottomRight,
            child: FlutterLogo(
              size: 20,
            ),
          ),
        ),
      ],
    );



  }

}