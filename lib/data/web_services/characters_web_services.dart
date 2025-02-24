import 'package:dio/dio.dart';
import 'package:rickandmorty_app/constants/strings.dart';

class CharactersWebServices {
  late Dio dio;
  late Dio dioQuote;

 CharactersWebServices() {
    BaseOptions characterOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    dio = Dio(characterOptions);

    BaseOptions quoteOptions = BaseOptions(
      baseUrl: quoteUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    dioQuote = Dio(quoteOptions);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data.toString());
      return response.data['results'];
    } on Exception catch (e) {
      print(e.toString());  
      return [];
    }
  }

 Future<List<dynamic>> getCharactersQuotes(String charName) async {
    try {
      Response response = await dioQuote.get('quotes',queryParameters: {'character':charName});
      print(response.data.toString());
      return response.data;
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }

}
