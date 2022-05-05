import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Notice Stateful Widget"),
        ),
        body: notice(),
      ),
    );
  }
}

//for statful

class notice extends StatefulWidget {
  @override
  State<notice> createState() => _noticeState();
}

class _noticeState extends State<notice> {
  void initState() {
    web();
    super.initState();
  }

  var resultBody = "Default Notice..."; //default value of result
  //here we have to decide states, also here we can declear own functionx

  web() async {
    var o1 = Uri.https("raw.githubusercontent.com",
        "/MDMOQADDAS/akuBitNotice/master/notice.txt");

    var output = await http.get(o1);

    setState(() {
      resultBody = output.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(resultBody),
    );
  }
}
