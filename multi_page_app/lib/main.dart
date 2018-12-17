import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: themeData,
  ));
}

// This for declaration a variable with name theme data,
// and create as a new object themedata
final ThemeData themeData =  ThemeData(
  canvasColor: Colors.lightGreenAccent,
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // Scaffold is a constructor to implements the basic material design visual layout structure.
    // and this class provides APIs for showing drawers, snack bars, and bottom sheets
    return Scaffold(
      // this will be create body canvas
      body: Center(
        // and the body have some child component this in here have Flatbutton
        child: FlatButton(
            onPressed: (){
              // when button even onPressed will call navigator.push and we'll pass in our context and then we'll pass in a second page
              Navigator.push(context, PageTwo());
            },
            // this will be button text
            child: Text("Go to Page Two")
        ),
      ),
    );
  }
}

class PageTwo extends MaterialPageRoute<Null>{
  // the page two we actually build out the page itself inside the constructor for page two
  PageTwo() : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 1.0,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context, PageThree());
          },
          child: Text("Go to Page Three"),
        ),
      ),
    );
  });
}

class PageThree extends MaterialPageRoute<Null> {
  PageThree() : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Last Page !"),
        backgroundColor: Theme.of(context).accentColor,
        elevation: 2.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(
        child: MaterialButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
            },
            child: Text("Go Home !"),
        ),
      ),
    );
  });
}
