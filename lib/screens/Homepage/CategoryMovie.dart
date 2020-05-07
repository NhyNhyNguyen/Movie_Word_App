import 'package:MovieWorld/constant/ImageConstant.dart';
import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/screens/Homepage/FakeData.dart';
import 'package:MovieWorld/screens/Homepage/MovieItem.dart';
import 'package:flutter/material.dart';

import 'BannerImage.dart';
import 'OptionTab.dart';


class CategoryMovie extends StatelessWidget {
  final String status;

  CategoryMovie(@required this.status);

  @override
  Widget build(BuildContext context) {
    final categoryMovie = FAKE_DATA.where((movie) {
      return movie.status.contains(status);
    }).toList();


//    return ListView.builder(itemBuilder: (context, index){
//      return Text(categoryMovie[index].imageUrl);
//    }, itemCount: categoryMovie.length,);

    return ListView.builder(itemBuilder: (context, index) {
      return Column(
        children: <Widget>[
          MovieItem( categoryMovie[index].id,categoryMovie[index].name,
              categoryMovie[index].imageUrl, categoryMovie[index].rate),
        ],
      );
    }, itemCount: categoryMovie.length,);



  }
}





