import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config.dart';
import '../models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = Config.apiKey;
  final String _apiUrl = Config.apiUrl;
  final String _language = Config.language;
  final String _bearerToken = Config.bearerToken;

  List<Result> onDisplayMovies = [];

  MoviesProvider() {
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_apiUrl, '/3/discover/movie', {
      "api_key": _apiKey,
      "language": _language,
    });

    var response = await http.get(
      url,
      headers: {
        //HttpHeaders.authorizationHeader: "Bearer $_bearerToken",
        "Accept": "application/json",
      },
    );

    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }
}
