import 'dart:convert';
import 'package:abp_energy_aoe/model/LoginResponse.dart';
import 'package:abp_energy_aoe/model/ResponseCsrfToken.dart';
import 'package:http/http.dart' as http;

class ApiServices {
    static String _baseUrl = "https://abpjobsite.com";
    static Future<ResponseCsrfToken> getToken() async {
      final response = await http.get(Uri.parse("$_baseUrl/refresh-csrf"), headers: {"Accept": "application/json"});
      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
        return ResponseCsrfToken.fromJson(json);
      }else{
        throw Exception('Failed to load token');
      }
    }
    
    static Future<LoginResponse> loginSubmit() async {
      final response = await http.post(Uri.parse("$_baseUrl/flutter/api/login/validate"),
          headers: {"Accept": "application/json"});
      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
        return LoginResponse.fromJson(json);
      }else{
        throw Exception('Failed to load token');
      }
    }
}