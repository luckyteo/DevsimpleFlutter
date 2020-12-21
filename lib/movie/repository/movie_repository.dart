import 'package:devsimple_flutter/movie/models/movie_response.dart';
import 'package:devsimple_flutter/services/http/http_client.dart';
class MovieRepository {
  final String _apiKey = "keyyyyyy";
  HttpClient client = HttpClient();

  Future<List<Movie>> fetchMovieList() async {
    final response = await client.get("movie.popular?api_key=$_apiKey");
    return MovieResponse.fromJson(response).results;
  }
}