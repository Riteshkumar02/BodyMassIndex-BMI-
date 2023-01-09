import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primaryColor: Colors.tealAccent,
        scaffoldBackgroundColor: Colors.tealAccent,
      ),
      home: Demo(),
    );
  }
}


class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _result=0;
 String __result="Health-Condition";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Heigh(cm)',
                icon: Icon(Icons.height),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight(kg)',
                icon: Icon(Icons.line_weight),
              ),
            ),
            SizedBox(height: 25),
            RaisedButton(
              // color: Colors.pinkAccent,
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: calculateBMI,
            ),
            SizedBox(height: 15),
            Text(
              _result == null ? "Enter Value" : "${_result.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
        Text(
          __result == null ? "__result" : "$__result",
          style: TextStyle(
            color: Colors.green,
            fontSize: 20.4,
            height: 2.2,
            fontWeight: FontWeight.w500,
          ),
        ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    _result = result;

    if(_result<18.5)
    {
      __result='Under-Weight';
    }
    else if(_result>=18.5 && _result<=25)
    {

      __result='Normal-Weight';
    }
    else if(_result>25 && _result<=30)
    {

      __result='Over-Weight';
    }
    else{
      __result='Obesity';
    }

    setState(() {


    });
  }
}

