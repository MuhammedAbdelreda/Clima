import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper({required this.url});
  final String url;

  Future getData() async{
    final uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    String data = response.body;
    if(response.statusCode == 200){
      print(data);
    }else{
      print(response.statusCode);
    }
  }

  
}