import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SongList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return SongListState();
  }
}

class SongListState extends State<SongList> {
  final controller = TextEditingController();

  void selectFiles() async {
    final selected_file =
        await FilePicker.platform.pickFiles(allowMultiple: false);
  }

  build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 17),
            hintText: 'Enter songs to upload',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(20),
          ),
          controller: controller,
        ),
        SizedBox(
          height: 0,
        ),

        // Center(
        //     child: FutureBuilder<ListResult>(
        //   future: futureFiles,
        //   builder: ((context, snapshot) {
        //     if (snapshot.hasData) {
        //       final files = snapshot.data!.items;

        //       return ListView.builder(
        //           itemCount: files.length,
        //           itemBuilder: (context, index) {
        //             final file = files[index];

        //             return ListTile(
        //               title: Text(file.name),
        //               trailing: IconButton(
        //                 icon: const Icon(Icons.download),
        //                 color: Colors.black,
        //                 onPressed: () {},
        //               ),
        //             );
        //           });
        //     }
        //   }),),
        // )
        Container(
            // color: Colors.blue[50],
            width: 380,
            height: 280,
            alignment: Alignment.topLeft,
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Container(
                  height: 50,
                  color: Colors.blueGrey[500],
                  child: const Center(child: Text('Song 1')),
                ),
                Container(
                  height: 50,
                  color: Colors.blueGrey[400],
                  child: const Center(child: Text('Song 2')),
                ),
                Container(
                  height: 50,
                  color: Colors.blueGrey[300],
                  child: const Center(child: Text('Song 3')),
                ),
                Container(
                  height: 50,
                  color: Colors.blueGrey[200],
                  child: const Center(child: Text('Song 4')),
                ),
                Container(
                  height: 50,
                  color: Colors.blueGrey[100],
                  child: const Center(child: Text('Song 5')),
                ),
              ],
            )),
        SizedBox(
          height: 0,
        ),

        // ElevatedButton.icon(
        //     icon: Icon(
        //       Icons.download,
        //       size: 20,
        //     ),
        //     onPressed: () => {print('button pressed')},
        //     label: Text('Get Songs')),

        FloatingActionButton.extended(
          label: Text('Get Songs'), // <-- Text
          backgroundColor: Colors.blueGrey,
          icon: Icon(
            // <-- Icon
            Icons.download,
            size: 15.0,
          ),
          onPressed: () {},
        ),

        SizedBox(
          height: 30,
        ),

        Row(children: [
          SizedBox(
            width: 20,
          ),
          Container(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
              icon: Icon(
                Icons.select_all,
                size: 20,
              ),
              onPressed: selectFiles,
              label: Text('Select Song'),
            ),
          ),
          const SizedBox(
            width: 120,
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
              icon: Icon(
                Icons.upload,
                size: 15,
              ),
              onPressed: () {
                final name = controller.text;
                createUser(name: name);
              },
              label: Text('Upload Song')),
        ]),
      ],
    );
  }

  Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('playlist').doc();

    // final json = {'song_name': 'Lose Control', 'artist_name': 'Meduza'};
    final user = User(
      id: docUser.id,
      song_name: 'song name',
      artist_name: 'artist name',
    );

    final json = user.toJson();

    await docUser.set(json);
  }
}

class User {
  late String id;
  late final String song_name;
  late final String artist_name;

  User({this.id = '', required this.song_name, required this.artist_name});

  Map<String, dynamic> toJson() =>
      {'id': id, 'song_name': song_name, 'artist_name': artist_name};
}
