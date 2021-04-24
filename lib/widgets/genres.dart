

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/bloc/get_genre_bloc.dart';
import 'package:flutter_movie_app/model/genre.dart';
import 'package:flutter_movie_app/model/genre_response.dart';
import 'package:flutter_movie_app/widgets/genre_list.dart';

class GenreScreen extends StatefulWidget {
  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {

  @override
  void initState() {
    super.initState();
    genresBloc..getGenre();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreResponse>(
      stream: genresBloc.subject.stream,
      builder: (context, AsyncSnapshot<GenreResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return _buildErrorWidget(snapshot.data.error);
          } else {
            return _buildGenreWidget(snapshot.data);
          }
        } else if (snapshot.hasError) {
           return _buildErrorWidget(snapshot.data.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Loading...",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error occured: $error"),
        ],
      ),
    );
  }

  Widget _buildGenreWidget(GenreResponse data)  {
    List<Genre> genres = data.genres;

    if(genres.length == 0) {
      return Container(
        child: Text("No Genre!"),
      );
    } else return GenreList(genres: genres,);
  }
}