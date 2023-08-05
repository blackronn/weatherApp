import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart'; // Import http package with alias
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherapp/utils/location.dart';

const apiKey = "4a74e6d0d5417f82f903f26466251d68";

class weatherDisplayData {
  late Icon weatherIcon;

  weatherDisplayData({required this.weatherIcon});
}

class WeatherData {
  LocationFinder locationData;
  double currentTemperature = 0.0;
  int currentCondition = 0;
  final int iconSize = 75;
  final iconColor = const Color(0xFFFFFFFF);

  late String city = "";

  WeatherData({required this.locationData});
  String getFormattedTemperature() {
    return currentTemperature.toStringAsFixed(1);}
  Future<void> getCurrentTemperature() async {
    await locationData.getCurrentLocation(); // Wait for the location data to be fetched.

    try {
      Uri uri = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}");
      Response response = await get(uri);
      if (response.statusCode == 200) {
        String data = response.body;
        var currentWeather = jsonDecode(data);

        currentTemperature = currentWeather["main"]["temp"];
        currentCondition = currentWeather["weather"][0]["id"];
        city = currentWeather["name"];
      } else {
        print("API'den değer gelmiyor");
      }
    } catch (e) {
      print("zort");
    }
    String getFormattedTemperature() {
      return currentTemperature.toStringAsFixed(1);
    }
  }

  weatherDisplayData? getWeatherDisplayData() {
      var now = new DateTime(DateTime.now().hour);
      if (now.hour >= 21) {
        if(currentCondition==800){
          return weatherDisplayData(weatherIcon: Icon(WeatherIcons.night_clear,size: 75,color: iconColor,));
        }
        else if(currentCondition>800){
          return weatherDisplayData(weatherIcon: Icon(WeatherIcons.night_alt_cloudy,size: 75,color: iconColor,));
        }
        else if(currentCondition==741){
          return weatherDisplayData(weatherIcon: Icon(WeatherIcons.night_fog,size: 75,color: iconColor,));
        }
        else if (currentCondition<=622||currentCondition>=600) {
          return weatherDisplayData(weatherIcon: Icon(WeatherIcons.night_snow,size: 75,color: iconColor,));
        }
        else if (currentCondition<=531||currentCondition>=500) {
          return weatherDisplayData(weatherIcon: Icon(WeatherIcons.night_rain,size: 75,color: iconColor,));
        }
        else if (currentCondition<=321||currentCondition>=300) {
          return weatherDisplayData(weatherIcon: Icon(WeatherIcons.night_sprinkle,size: 75,color: iconColor,));
        }
        else{
          return weatherDisplayData(weatherIcon: Icon(WeatherIcons.night_thunderstorm,size: 75,color: iconColor,));
        }
      } else {
        if(currentCondition==800){
          return weatherDisplayData(weatherIcon: Icon(WeatherIcons.day_sunny_overcast,size: 75,color: iconColor,));
        }
        else if(currentCondition>800){
          return weatherDisplayData(weatherIcon: Icon(WeatherIcons.day_cloudy,size: 75,color: iconColor,));
          }
        else if(currentCondition==741){
          return weatherDisplayData(weatherIcon: Icon(WeatherIcons.day_fog,size: 75,color: iconColor,));
        }
        else if (currentCondition<=622||currentCondition>=600) {
          return weatherDisplayData(weatherIcon: Icon(WeatherIcons.day_snow,size: 75,color: iconColor,));
        }
        else if (currentCondition<=531||currentCondition>=500) {
          return weatherDisplayData(weatherIcon: Icon(WeatherIcons.day_rain,size: 75,color: iconColor,));
        }
        else if (currentCondition<=321||currentCondition>=300) {
          return weatherDisplayData(weatherIcon: Icon(WeatherIcons.day_sprinkle,size: 75,color: iconColor,));
        }
        else{
          return weatherDisplayData(weatherIcon: Icon(WeatherIcons.day_thunderstorm,size: 75,color: iconColor,));
        }

      }

  }

}
