import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:startwarsapp/models/movie_model.dart';

class HomeViewModel extends GetxController {
  final movies = <Results>[].obs;

  @override
  void onInit() {
    super.onInit();
    //fetchMovies();
  }

  String formatDate(String? fullDate) {
    if (fullDate == null || fullDate.isEmpty) {
      return '';
    }

    final DateTime parsedDate = DateTime.parse(fullDate);
    final String formattedDate =
        "${parsedDate.day}-${parsedDate.month}-${parsedDate.year}";
    return formattedDate;
  }

  String truncateDescription(String description, int maxCharacters) {
    description = description.replaceAll('\r\n', ' ');

    if (description.length <= maxCharacters) {
      return description;
    } else {
      return '${description.substring(0, maxCharacters)}...';
    }
  }

  String truncateProducerNames(String producer) {
    final names = producer.split(', ');
    return names.length > 2 ? '${names.sublist(0, 2).join(', ')}...' : producer;
  }

  Future<void> fetchMovies() async {
    try {
      final response =
          await http.get(Uri.parse('https://swapi.dev/api/films/'));
      print("response.statusCode: ${response.statusCode}");

      if (response.statusCode == 200) {
        print("response.body: ${response.body}");
        final Map<String, dynamic> decodedResponse = json.decode(response.body);

        final List<dynamic> movieList = decodedResponse['results'] ?? [];

        movies.assignAll(
          movieList.map(
              (movie) => Results.fromJson(Map<String, dynamic>.from(movie))),
        );
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      print('Error: $error');
    } finally {}
  }
}
