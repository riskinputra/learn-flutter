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
        primarySwatch: Colors.indigo,
      ),
      home: InputBox(),
    );
  }
}

class InputBox extends StatefulWidget {
  @override
  InputBoxState createState() => InputBoxState();
}

class InputBoxState extends State<InputBox>{
  bool loggedIn = false;
  // to declare variable is a private using underscore
  String email, username, password;

  final formKey = GlobalKey<FormState>();
  final mainKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: mainKey,
      appBar: AppBar(title: Text("Form Example"),),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: loggedIn == false ? Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Email"
                ),
                validator: (str) => !str.contains('@') ? "Not a Valid Email" : null,
                onSaved: (str) => email = str,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Username",
                ),
                validator: (str) => str.length <= 5 ? "Not a Valid Usename" : null,
                onSaved: (str) => username = str,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Password"
                ),
                validator: (str) => str.length <= 7 ? "Not a Valid Password" : null,
                onSaved: (str) => password = str,
                // for show dots (*) in password type
                obscureText: true,
              ),
              RaisedButton(
                child: Text("Submit"),
                onPressed: onPressed
              )
            ],
          )
        ) : Center(
          child: Column(
            children: <Widget>[
              Text("Welcome $username"),
              RaisedButton(
                child: Text("Log Out "),
                onPressed: (){
                  setState(() {
                    loggedIn = false;
                  });
                },
              )
            ],
          ),
        )
      ),
    );
  }

  void onPressed() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        loggedIn = true;
      });

      var snackBar = SnackBar(
        content: Text(
          "Username $username, Email $email, Password $password"
        ),
        duration: Duration(milliseconds: 5000),
      );

      mainKey.currentState.showSnackBar(snackBar);
    }
  }
}
