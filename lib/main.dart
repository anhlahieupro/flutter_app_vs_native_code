import 'package:flutter/material.dart';
import 'package:flutter_app_vs_native_code/method_channel_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final x = 5;
  final y = 4;
  int value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(x.toString() + ' vs ' + y.toString()),
            const SizedBox(height: 10),
            Text('= ' + (value?.toString() ?? '...')),
            const SizedBox(height: 20),
            FlatButton(
              child: Text('Add'),
              onPressed: () async {
                try {
                  final result = await MethodChannelHelper.handleAdd(x, y) as int;
                  value = result;
                } catch (e) {
                  value = -1;
                  print(e);
                }
                setState(() {});
              },
            ),
            FlatButton(
              child: Text('Sub'),
              onPressed: () async {
                try {
                  final result = await MethodChannelHelper.handleSub(x, y) as int;
                  value = result;
                } catch (e) {
                  value = -1;
                  print(e);
                }
                setState(() {});
              },
            )
          ],
        ),
      ), //
    );
  }
}
