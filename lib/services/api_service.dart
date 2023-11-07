import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:heartdisease/models/wine_data.dart';

class ApiService {
  final String apiUrl =
      "https://wine-ml-service-emmannem.cloud.okteto.net/predict";

  Future<WineQuality> postWineData(WineData data) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data.toJson()),
    );

    if (response.statusCode == 200) {
      return WineQuality.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al realizar la solicitud a la API');
    }
  }
}
