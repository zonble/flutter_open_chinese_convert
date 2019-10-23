import 'package:flutter/material.dart';
import 'package:flutter_opencc/flutter_opencc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String converted = '';

  @override
  void initState() {
    super.initState();
    convert();
  }

  Future<void> convert() async {
    var text = "鼠标里面的硅二极管坏了，导致光标分辨率降低。";
    var result = await ChineseConverter.convert(text, S2TWp());
    print('conveter...');
    print(result);
    setState(() => converted = result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text(converted ?? ''),
        ),
      ),
    );
  }
}
