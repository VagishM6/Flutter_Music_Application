// import 'dart:html';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import './text_return.dart';
import './music.dart';
import './favourites.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int currentIndex = 0;
  // PlatformFile? selected_file;
  // var number = 0;
  // var list = [100, 200, 300, 400, 500, 600];

  final screens = [Music(), Favourites()];
  // void nextComponent() {
  //   setState(() {
  //     number = number + 1;
  //   });
  // }

  build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: const Text(
              'Music Player',
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        // drawer: Text('Drawer panel'),
        body: Column(
          children: [
            screens[currentIndex],
          ],
        ),

        // Column(
        //   children: [
        //     TextReturn('Music Player'),
        //     Container(
        //       width: double.infinity,
        //       child: Text(
        //         'Hello ' + list[number].toString(),
        //         style: TextStyle(fontSize: 20),
        //         textAlign: TextAlign.center,
        //       ),
        //     ),
        //     ElevatedButton(
        //       onPressed: nextComponent,
        //       child: Text('Next'),
        //     ),
        //     ElevatedButton(onPressed: selectFiles, child: Text('file')),
        //     Center(
        //       child: Container(
        //         height: 120.0,
        //         width: 120.0,
        //         color: Colors.blue[50],
        //         child: const Align(
        //             alignment: Alignment.center, child: Text('Text')),
        //       ),
        //     ),
        //   ],
        // ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: const [
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.home_max_rounded),
              //     label: 'Home',
              //     backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  icon: Icon(Icons.music_note_rounded),
                  label: 'Music',
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_rounded),
                  label: 'Favourites',
                  backgroundColor: Colors.black)
            ]),
      ),
    );
  }
}
