import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AgeClass>(
      create: (context) => AgeClass(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Level1(),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cy is ${Provider.of<AgeClass>(context).age}'),
      ),
      body: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Level3(),
            FlatButton(
              color: Colors.blue,
              onPressed: Provider.of<AgeClass>(context).addAge,
              child: Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'My Real Age is ${Provider.of<AgeClass>(context).age}',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class AgeClass extends ChangeNotifier {
  int age = 10;

  void addAge() {
    age++;
    notifyListeners();
  }
}
