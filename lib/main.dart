//app that is playing a game that guesses the number between 1 and 100

import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('超級無敵開口中'),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Guessingvalue(),
      ),
    );
  }
}

class winning_page extends StatelessWidget {
  const winning_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '恭喜你了中咗啦',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '再玩一次',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Guessingvalue extends StatefulWidget {
  const Guessingvalue({super.key});

  @override
  State<Guessingvalue> createState() => _GuessingvalueState();
}

class _GuessingvalueState extends State<Guessingvalue> {
  final myController = TextEditingController();
  int min = 1;
  int max = 100;
  late int ans;

  @override
  void initState() {
    super.initState();
    ans = Random().nextInt(100) + 1;
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _checkAnswer(int guess) {
    if (ans == guess) {
      setState(() {
        ans = Random().nextInt(100) + 1;
        min = 1;
        max = 100;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => winning_page()),
      );
    } else if (guess < ans) {
      setState(() {
        min = guess;
      });
    } else {
      setState(() {
        max = guess;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(4.0),
                color: Colors.black,
                child: Text(
                  'Min: $min      Max: $max',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: ('估個數字(1~100)'),
                ),
                controller: myController,
              ),
            ),
            TextButton(
              onPressed: () {
                _checkAnswer(int.parse(myController.text));
              },
              child: Text(
                '確定',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
