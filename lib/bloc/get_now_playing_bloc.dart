import 'package:flutter_movie_app/model/movie_response.dart';
import 'package:flutter_movie_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class NowPlayingMoviesListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getNowPlayingMovies() async {
    MovieResponse response = await _repository.getPlayingMovies();
    _subject.sink.add(response);
  }
  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final nowPlayingMoviesBloc = NowPlayingMoviesListBloc();