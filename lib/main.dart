import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      //nextInt(max) 는 0 ~ (max) 까지 랜덤 카운트 해주니 0 ~ 5 까지만 나옴.
      //1 ~ 6 까지를 원하면 끝에 + 1 을 해주면 된다.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: FlatButton(
              //FlatButton 위젯은 void 콜백 () 을 가짐. 인수가 없으며 데이터를 반환안함.
              //고로 익명함수. onPressed: () { //doSomething }
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset(
                //이미지 위젯보다 코드를 간결하게 해줌
                'images/dice$leftDiceNumber.png',
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset(
                'images/dice$rightDiceNumber.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
