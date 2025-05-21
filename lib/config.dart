import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  //BASE
  static String get apiKey => dotenv.env['API_KEY'] ?? 'NOENCONTRADAKEY';
  static String get bearerToken => dotenv.env['BEARER_TOKEN'] ?? '';
  static String get apiUrl => dotenv.env['API_URL'] ?? '';
  static String get language => dotenv.env['LANGUAGE'] ?? 'es-ES';
  //IMAGES
  static String get baseImageUrl => dotenv.env['IMAGE_BASE_URL'] ?? '';
  static String get backdropSizeUrl =>
      dotenv.env['BACKDROP_SIZE_W300'] ?? 'w300/';
  static String get logoSizeUrl => dotenv.env['LOGO_SIZE_W45'] ?? 'w45/';
  static String get posterSizeUrl => dotenv.env['POSTER_SIZE_W500'] ?? 'w500/';
  static String get profileSizeUrl =>
      dotenv.env['PROFILE_SIZE_W185'] ?? 'w185/';
  static String get stillSizeUrl => dotenv.env['STILL_SIZE_W185'] ?? 'w185/';
}
