import 'package:flutter_movie_app/model/cast.dart';

class CastResponse {
  final List<Cast> casts;
  final String error;

  CastResponse(
    this.casts,
    this.error,
  );

  CastResponse.fromJson(Map<String, dynamic> json)
      : casts = (json["cast"] as List).map((e) => Cast.fromJson(e)).toList(),
        error = "";
  CastResponse.withError(String errorValue)
      : casts = [],
        error = errorValue;
}
