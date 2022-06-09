import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:peliculas/models/television.dart';

class TelevisionProvider extends ChangeNotifier {
  final String _apiKey = '5c09848016f9c912e7e0ddd179a0b4f8';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Television> tv = [];

  getTelevision(int movieId) async {
    final url = Uri.https(
      _baseUrl,
      '3/tv/$movieId',
      {
        'api_key': _apiKey,
        'language': _language,
      },
    );

    final response = await http.get(url);
    final television = Television.fromJson(response.body);

    tv.add(television);
    return television;
  }
}
