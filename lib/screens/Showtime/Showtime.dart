import 'package:MovieWorld/constant/StringConstant.dart';
import 'package:MovieWorld/constant/StyleConstant.dart';
import 'package:MovieWorld/screens/Bloc/homepage_bloc.dart';
import 'package:MovieWorld/screens/Bloc/homepage_event.dart';
import 'package:MovieWorld/screens/Bloc/homepage_state.dart';
import 'package:MovieWorld/screens/Bloc/showtime_bloc.dart';
import 'package:MovieWorld/screens/Bloc/showtime_event.dart';
import 'package:MovieWorld/screens/Bloc/showtime_state.dart';
import 'package:MovieWorld/screens/ButtonGradient.dart';
import 'package:MovieWorld/screens/Homepage/CategoryMovie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MovieWorld/constant/UrlConstant.dart';
import 'package:MovieWorld/model/Movie.dart';
import 'package:flutter/widgets.dart';
import 'package:MovieWorld/constant/ColorConstant.dart';
import 'package:MovieWorld/layout/mainLayout.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../constant/ColorConstant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'DateItem.dart';
import 'ShowtimeMovieItem.dart';

class MyShowtime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayOut.getMailLayout(
        context,
        MultiBlocProvider(
            providers: [
              BlocProvider<ShowtimeBloc> (
                builder: (context) => ShowtimeBloc(),
              )
            ],
            child: Showtime()
        ),
        'CAL') ;
  }
}

class Showtime extends StatefulWidget {
  @override
  _ShowtimeState createState() => _ShowtimeState();
}

class _ShowtimeState extends State<Showtime> {
  DateTime date = DateTime.now();
  List<int> listDuration = [0, 1, 2, 3, 4, 5, 6];

  String url;
  List<Movie> data;

  @override
  Widget build(BuildContext context) {
    final ShowtimeBloc showtimeBloc = BlocProvider.of<ShowtimeBloc>(context);
    return Container(
        color: ColorConstant.VIOLET,
        child: BlocBuilder<ShowtimeBloc, ShowtimeState>(
            bloc: showtimeBloc,
            builder: (context, state) {

              List<Movie> _getData(String id) {
                url = UrlConstant.URL_FILM + id;
                {
                  http.get(url).then((http.Response response) {
                    setState(() {
                      data = new List<Movie>();
                      json.decode(response.body).forEach((json) {
                        data.add(Movie.fromJson(json));
                      });
                    });
                  });
                };
                return data;
              }

              return Column(
                  children: <Widget>[
                    Container(
                      height: 70,
                      margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.only(top: 8, left: 20),
                      decoration: BoxDecoration(
                          color: ColorConstant.LIGHT_VIOLET,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: GridView.count(
                          crossAxisCount: 7,
                          childAspectRatio: 0.75,
                          children:
                          listDuration.map(
                                (item) =>
                                InkWell(
                                    onTap: () =>showtimeBloc.dispatch(ChangeDate(item)),
                                    child: DateItem(date, false, item)),
                          ).toList()
                      ),
                    ),
                    Text('${state.firstDate}', style: StyleConstant.bigTxtStyle,),
                    Container(
                      height: 500,
                      child: Column(
                        children: <Widget>[
                          ShowtimeMovieItem(
                              '1', 'Avenger', 'avenger.jpg', 'Action', '120'),
                          ShowtimeMovieItem(
                              '1', 'Avenger', 'kingdom.jpg', 'Action', '120'),
                        ],
                      ),
                    )
                  ]);
            }
        )
    );
  }
}
