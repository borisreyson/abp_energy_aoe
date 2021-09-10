// To parse this JSON data, do
//
//     final responseCsrfToken = responseCsrfTokenFromJson(jsonString);

import 'dart:convert';

ResponseCsrfToken responseCsrfTokenFromJson(String str) => ResponseCsrfToken.fromJson(json.decode(str));

String responseCsrfTokenToJson(ResponseCsrfToken data) => json.encode(data.toJson());

class ResponseCsrfToken {
  ResponseCsrfToken({
    required this.csrfToken,
  });

  String csrfToken;

  factory ResponseCsrfToken.fromJson(Map<String, dynamic> json) => ResponseCsrfToken(
    csrfToken: json["csrf_token"],
  );

  Map<String, dynamic> toJson() => {
    "csrf_token": csrfToken,
  };
}
