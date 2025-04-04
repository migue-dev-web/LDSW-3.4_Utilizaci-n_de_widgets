import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Act LDSW -3.4. Utilización de widgets"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Text(
              '¡Hola, Mundo!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,

                  child: Text(
                    'column 1',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                  ),
                ),
                Container(
                  width: 35,
                  height: 30,
                  child: Text(
                    'column 2',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
                  ),
                  color: Colors.red,
                ),
                Container(
                  width: 60,
                  height: 50,
                  child: Text(
                      'column 3',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                  ),
                ),
                Container(
                  width: 40,
                  height: 30,
                  color:Colors.blue,
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Container(
                    width: 100,
                    height: 50,
                    color:Colors.grey,
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    color:Colors.grey,
                  )
                ]
            ),

            SizedBox(height: 20),

            Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue[300],
                ),
                Positioned(
                  top: 50,
                  left: 50,
                  child: Container(
                    width: 100,
                    height: 100,
                    color:Colors.yellow,
                    child: Text(
                      'Stackeado'

                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
