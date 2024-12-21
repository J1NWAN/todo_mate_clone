import 'package:http/http.dart' as http;
import 'dart:convert';

class MyService {
  Future<Map<String, dynamic>> getAdvice() async {
    // Open API 사용
    final response = await http.get(Uri.parse('https://korean-advice-open-api.vercel.app/api/advice'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('명언을 가져오는데 실패했습니다');
    }
  }
}
