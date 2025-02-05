import 'package:dio/dio.dart';
import 'package:rickandmorty_app/constants/strings.dart';
import 'package:rickandmorty_app/data/models/character.dart';

class CharactersWebServices {
  late Dio dio;
  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data.toString());
      return response.data;
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }
}
