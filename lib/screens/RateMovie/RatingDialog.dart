import 'package:flutter/material.dart';

class RatingMovieDialog extends StatefulWidget {
  @override
  _RatingMovieDialogState createState() => _RatingMovieDialogState();
}

class _RatingMovieDialogState extends State<RatingMovieDialog> {
  int lastRate = 0;

  Widget _buildStar(int starCount) {
    return InkWell(
      child: Icon(
        Icons.star,
        // size: 30.0,
        color: lastRate >= starCount ? Colors.orange : Colors.grey,
      ),
      onTap: () {
        setState(() {
          lastRate = starCount;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Rate this movie'),),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildStar(1),
          _buildStar(2),
          _buildStar(3),
          _buildStar(4),
          _buildStar(5),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: Navigator.of(context).pop,
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop(lastRate);
            print(lastRate);
          },
        )
      ],
    );
  }
}