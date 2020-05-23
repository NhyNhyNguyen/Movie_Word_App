import 'package:MovieWorld/screens/Homepage/FakeData.dart';
import 'package:MovieWorld/screens/Homepage/MovieItem.dart';
import 'package:flutter/material.dart';

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

    return GridView.count(
        crossAxisCount: 2,
    children:
        categoryMovie.map(
        (item) =>MovieItem(item.id,item.name, item.imageUrl, item.rate)
        ).toList()
    );

  }
}





