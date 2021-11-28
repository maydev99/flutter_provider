import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';


class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}


class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);


  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

 @override
  void initState() {
    MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (_) => Counter()),
      ],
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         context.read<Counter>().increment();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Text('${context.watch<Counter>().count}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 80,
          ),),
      ),
    );
  }
}

void makeASnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    ),
  );
}