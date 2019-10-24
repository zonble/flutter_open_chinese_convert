import 'package:flutter/material.dart';
import 'package:flutter_open_chinese_convert/flutter_open_chinese_convert.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  String original = '鼠标里面的硅二极管坏了，导致光标分辨率降低。\n滑鼠裡面的矽二極體壞了，導致游標解析度降低。';
  String converted = '';

  @override
  void initState() {
    super.initState();
    convert();
  }

  Future<void> convert() async {
    var text = original;
    var option = ChineseConverter.allOptions[index];
    var result = await ChineseConverter.convert(text, option);
    setState(() => converted = result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PopupMenuButton<int>(
                    elevation: 2,
                    child: Text(
                        ChineseConverter.allOptions[index].chineseDescription,
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    onSelected: (i) {
                      index = i;
                      convert();
                    },
                    itemBuilder: (context) =>
                        List.of(ChineseConverter.allOptions
                            .asMap()
                            .map((i, x) => MapEntry(
                                i,
                                PopupMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          width: 40,
                                          child: i == index
                                              ? Icon(Icons.check)
                                              : Container()),
                                      Expanded(
                                          child: Text(x.chineseDescription,
                                              style:
                                                  TextStyle(fontSize: 12.0))),
                                    ],
                                  ),
                                  value: i,
                                )))
                            .values)),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text('Original:', style: Theme.of(context).textTheme.title),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(original),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text('Conveted:', style: Theme.of(context).textTheme.title),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(converted ?? ''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
