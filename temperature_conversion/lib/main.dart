import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: TempApp(),
    );
  }
}

class TempApp extends StatefulWidget {
  @override
  TempState createState() => TempState();
}

class TempState extends State<TempApp> {
  double input, output;
  bool fOrC;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    input = 0.0;
    output = 0.0;
    fOrC = true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // for declare an input type as a TextField
    // and have type as number.
    TextField inputField = TextField(
      keyboardType: TextInputType.number,
      onChanged: (str) { // when inputField in typing
        try { // this will checking if the typing is number or no
          input = double.parse(str); // if typing is a number input define will overwrite with double number
        } catch(e) {
          input = 0.0; // if not number input will set default.
        }
      },
      decoration: InputDecoration(
        labelText: "Input a value in ${!fOrC ? "Farenheit" : "Celcius"}"
      ),
    );

    AppBar appBar = AppBar(
      title: Text("Temperature Calculator"),
    );

    Container tempSwitch = Container(
      child: Row(
        children: <Widget>[
          // Text("Choose Farenheit and Celcius"),
          // Switch(
            // value: fOrC,
            // onChanged: (e) {
              // setState(() {
                // fOrC = !fOrC;
              // });
            //}
          //),
          // Checkbox(
            // value: fOrC,
            // onChanged: (e) {
              // setState(() {
                // fOrC = !fOrC;
              // });
            // },
          // ),
          Text("F"),
          Radio<bool> (
            groupValue: fOrC,
            value: false,
            onChanged: (val) {
              setState(() {
                fOrC = val;
              });
            },
          ),
          Text("C"),
          Radio<bool> (
            groupValue: fOrC,
            value: true,
            onChanged: (val) {
              setState(() {
                fOrC = val;
              });
            },
          )
        ],
      ),
    );

    Container calcBtn = Container(
      child: RaisedButton(
        child: Text("Calculate"),
        onPressed: () {
          setState(() {
            !fOrC
                ? output = (input - 32) * (5 / 9)
                : output = (input * 9 / 5) + 32;
          });
          AlertDialog dialog = AlertDialog(
            content: !fOrC
              ? Text("${input.toStringAsFixed(3)} F : ${output.toStringAsFixed(3)} C")
              : Text("${input.toStringAsFixed(3)} C : ${output.toStringAsFixed(3)} F")
          );
          showDialog(context: context, child: dialog);
        },
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            inputField,
            tempSwitch,
            calcBtn
          ],
        ),
      ),
    );
  }
}