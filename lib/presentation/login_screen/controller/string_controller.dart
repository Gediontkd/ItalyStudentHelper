import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class StringService {
  final String url = dotenv.env['SERVER_URL']! + 'getStrings';

  Future<Map<String, String>> fetchStrings() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((key, value) => MapEntry(key, value.toString()));
    } else {
      throw Exception('Failed to load strings');
    }
  }
}


class StringController extends GetxController {
  var strings = <String, String>{}.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchStrings();
    super.onInit();
  }

  void fetchStrings() async {
    try {
      isLoading(true);
      var fetchedStrings = await StringService().fetchStrings();
      strings.value = fetchedStrings;
    } finally {
      isLoading(false);
    }
  }
}
