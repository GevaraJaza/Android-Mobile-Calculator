import 'package:calculator/mybuttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:math_expressions/math_expressions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _q = "";
  var _a = "";
  TextStyle _style = TextStyle(
    color: Colors.black,
    fontSize: 30,
  );
  final List<String> bt = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '.',
    '0',
    '^',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 212, 252),
      body: Expanded(
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      _q,
                      style: _style,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      _a,
                      style: _style,
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                flex: 4,
                child: Container(
                  child: GridView.builder(
                    itemCount: bt.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      // this is Clear button
                      if (index == 0) {
                        return MyButtons(
                            ButtonTabed: () {
                              setState(() {
                                _q = '';
                                _a = '';
                              });
                            },
                            Color: Colors.green,
                            TextColor: Colors.white,
                            ButtonText: bt[index]);
                      } else if (index == 1) {
                        //this is Delete button
                        return MyButtons(
                            ButtonTabed: () {
                              setState(() {
                                try{
                                  _q = _q.substring(0, _q.length - 1);
                                }catch(e){
                                  print(e);
                                }
                              });
                            },
                            Color: Colors.red,
                            TextColor: Colors.white,
                            ButtonText: bt[index]);
                      } else if (index == bt.length - 1) {
                        //this is Equal button
                        return MyButtons(
                            ButtonTabed: () {
                              setState(() {
                                equaltabed();
                              });
                            },
                            Color: Colors.deepPurple,
                            TextColor: Colors.white,
                            ButtonText: bt[index]);
                      } else {
                        //this is other buttons
                        return MyButtons(
                            ButtonTabed: () {
                              setState(() {
                                _q += bt[index];
                              });
                            },
                            Color: isopertor(bt[index])
                                ? Colors.deepPurple
                                : Colors.white,
                            TextColor: isopertor(bt[index])
                                ? Colors.white
                                : Colors.deepPurple,
                            ButtonText: bt[index]);
                      }
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }

  bool isopertor(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  void equaltabed() {
    String finalanswer = _q;
    finalanswer=finalanswer.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalanswer);
    ContextModel cm = ContextModel();
    Power xSquare = Power(_q, _q);
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    _a = eval.toString();
  }
}
