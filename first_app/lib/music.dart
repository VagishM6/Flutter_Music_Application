import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Music extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return MusicState();
  }
}

class MusicState extends State {
  final musicPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Container(
          height: 80,
          //color: Colors.blue[50],
          alignment: Alignment.center,
          child: Text(
            'Music',
            style: TextStyle(fontSize: 50),
          ),
        )),
        // Container(
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(8.0),
        //     child: Image.network(
        //       height: 220,
        //       'https://images.unsplash.com/photo-1674575496466-5119fd691bf4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
        //     ),
        //   ),
        // ),
        // const SizedBox(
        //   height: 250,
        // ),

        Container(
          height: 260,
          width: 300,
          // color: Colors.blue[50],
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
              size: Size.fromRadius(48), // Image radius
              child: Image.network(
                  'https://images.unsplash.com/photo-1674575496466-5119fd691bf4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                  fit: BoxFit.cover),
            ),
          ),
          // 'https://images.unsplash.com/photo-1674575496466-5119fd691bf4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',

          // ClipRRect(
          //   borderRadius: BorderRadius.circular(180.0),
          //   child: Image.network(
          //     'https://images.unsplash.com/photo-1674575496466-5119fd691bf4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          //     height: 150.0,
          //     width: 100.0,
          //   ),
          // )

          // Image.network(
          //   'https://images.unsplash.com/photo-1674575496466-5119fd691bf4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          //   height: 500,
          // ),
        ),

        SizedBox(
          height: 5,
        ),

        Text(
          'Song Example',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Artist Name',
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          height: 15,
        ),
        Slider(
            value: position.inSeconds.toDouble(), onChanged: (value) async {}),
        SizedBox(
          height: 20,
        ),

        ElevatedButton.icon(
            icon: Icon(
              Icons.favorite_rounded,
              size: 20,
            ),
            onPressed: () => {},
            label: Text('Add to Favourites')),

        // FloatingActionButton.extended(
        //   label: Text('Add to Favourites'), // <-- Text
        //   backgroundColor: Colors.blueGrey,
        //   icon: Icon(
        //     Icons.favorite_border,
        //     size: 15.0,
        //   ),
        //   onPressed: () {},
        // ),

        SizedBox(
          height: 15,
        ),

        // TextField(),

        // SizedBox.fromSize(
        //   size: Size(56, 56),
        //   child: ClipOval(
        //     child: Material(
        //       color: Colors.redAccent,
        //       child: InkWell(
        //         splashColor: Colors.lightBlueAccent,
        //         onTap: () {},
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: <Widget>[
        //             Icon(Icons.favorite), // <-- Icon
        //             Text("like"), // <-- Text
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
