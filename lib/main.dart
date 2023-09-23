import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// this is used to check for the platform and initialize the app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  final color = <String, dynamic>{
    "red": 225,
    "green": 201,
    "blue": 255,
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Changing App',
      home: ColorChangeScreen(),
    );
  }
}

class ColorChangeScreen extends StatefulWidget {
  @override
  _ColorChangeScreenState createState() => _ColorChangeScreenState();


}

class _ColorChangeScreenState extends State<ColorChangeScreen> {
  static const id = "wI8Dl5vug5exPYYWmUB1";

  final db = FirebaseFirestore.instance;

  int red = 225;
  int green = 201;
  int blue = 255;

  int currentIndex = 0;

  @override
  void initState() {
 
    super.initState();
     db.collection("colors").get().then((event) {
      print("${event.docs[0].id} => ${event.docs[0].data()}");
    });

  }

  void changeColor({r = 0, g = 0, b = 0}) {
    final color = {
      'color': <String, dynamic>{
        "red": r,
        "green": g,
        "blue": b,
      }
    };
    
      db
      .collection("colors")
      .doc(id)
      .update(color)
      .then((value) => {
            setState(() {
              red = r;
              green = g;
              blue = b;
            }),
            print("Color updated successfully $green $red $blue")
          }

      ).catchError((error) => print("Failed to update color: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Change App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(red, green, blue, 1)
              ),
            ),
            SizedBox(height: 20),



            ElevatedButton(
              onPressed: () async {
                changeColor(g: 255);
              
              },
              child: const Text('Change Color to green',
                ),
            ),

               ElevatedButton(
              onPressed: () async {
                changeColor(b:255);
              
              },
              child: const Text('Change Color to blue',
                  ),
            ),
               ElevatedButton(
              onPressed: () async {
                changeColor(r:255);
              },
              child: const Text('Change Color to red ',
                  ),
            ),

            
          ],
        ),
      ),
    );
  }
}
