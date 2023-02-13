import 'package:flutter/material.dart';
import './song_list.dart';

class Favourites extends StatelessWidget {
  build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Container(
          height: 80.0,
          width: 300,
          // color: Colors.blue[50],
          alignment: Alignment.center,
          //margin: EdgeInsets.all(50),

          child: Text(
            'Favourites',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        )),
        SongList()
      ],
    );
  }
}
