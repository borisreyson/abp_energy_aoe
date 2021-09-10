import 'dart:convert';
import 'package:abp_energy_aoe/Models/ResponseCsrfToken.dart';
import 'package:http/http.dart' as http;

class ApiServices {
    static String _baseUrl = "https://abpjobsite.com:8443";
    static Future<ResponseCsrfToken> getToken() async {
      final response = await http.get(Uri.parse("$_baseUrl/refresh-csrf"), headers: {"Accept": "application/json"});
      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
        return ResponseCsrfToken.fromJson(json);
      }else{
        throw Exception('Failed to load album');
      }
   }
}