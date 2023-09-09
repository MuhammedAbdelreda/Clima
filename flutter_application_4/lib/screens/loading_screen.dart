import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/services/location.dart';
import 'package:flutter_application_4/services/networking.dart';
import 'package:js/js.dart';
import 'package:geolocator/geolocator.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'b4798f48692addcd8c9f16a3c52ce821';
double? latitude;
double? longitude;

Location l = Location();

class Loading_Screen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

/*void getData() async {
  const url='';
  final uri = Uri.parse(url);
  http.Response response = await http.get(uri);
  String data = response.body;

  int js =jsonDecode(data)[0]["userId"];
  print(js);

  /*if(response.statusCode ==200){
    print(data);
  }else{
    print(response.statusCode);
  }*/
}*/

class _LoadingScreenState extends State<Loading_Screen> {
  @override
  Widget build(BuildContext context) {

    void getLocation() async {
      l.getCurrentLocation();
      NetworkHelper networkHelper = NetworkHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?lat=${l.latitude}&lon=${l.longitude}&appid=$apiKey',
      );
      var weatherData = await networkHelper.getData();
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return LocationScreen(LocationWeather: weatherData,);
        },
      ));

      //print(l.latitude);
      //print(l.longitude);
    };
    getLocation();

    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.amber,
          size: 50.0,
        ),
      ),
    );
  }
}







/*
        child: ElevatedButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Location'),
        ),*/