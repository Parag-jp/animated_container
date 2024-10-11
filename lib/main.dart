import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _width = 200.0;
  var _height = 100.0;


  bool flag = true;

  Decoration myDecor = BoxDecoration(
    borderRadius: BorderRadius.circular(2),
      color: Colors.blueGrey.shade900,
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(

              width: _width,
                height: _height,
                curve: Curves.bounceInOut,
                duration: Duration(seconds: 2),
              decoration: myDecor,
            ),
          ),
          ElevatedButton(onPressed: (){

            setState(() {
              if(flag == true) {
                _width = 100.0;
                _height = 200.0;

                myDecor = BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    color:  Colors.red,
                );

                flag = false;
              }
              else{
                _width = 200.0;
                _height = 100.0;

                myDecor = BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                  color:  Colors.blueGrey.shade900,
                );

                flag = true;

              }
            });
          }, child: Text("Animate"))
        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
