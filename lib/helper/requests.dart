import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<http.Response> postData(String name) {
  return http.post(
    Uri.parse('http://127.0.0.1:5000/get_name'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: convert.jsonEncode(<String, String>{
      'name': name,
    }),
  );
}