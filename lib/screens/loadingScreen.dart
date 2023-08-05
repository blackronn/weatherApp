
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/screens/homePage.dart';
import 'package:weatherapp/utils/location.dart';
import 'package:weatherapp/weather.dart';

class loadingScreen extends StatefulWidget {
  const loadingScreen({super.key});

  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  late LocationFinder locationData;
  Future<void> getLocationData() async {
    locationData = LocationFinder();
    await locationData.getCurrentLocation();
    if (locationData.latitude == null || locationData.longitude == null) {
      print("Konum Bilgileri yok");
    } else {
      print(locationData.latitude);
      print(locationData.longitude);
    }
  }

  void getWeatherData() async {
    await getLocationData();
    WeatherData weatherData = WeatherData(locationData: locationData);
    await weatherData.getCurrentTemperature();
    if (weatherData.currentCondition == null ||
        weatherData.currentTemperature == null) {
      print("API'den sıcaklık veya durum bilgisi boş dönüyor");
    }
    Navigator.pushReplacement(context as BuildContext,
        MaterialPageRoute(builder: (context) {
          return homePage(weatherData: weatherData);
        }));
  }

  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.indigo,
                  Colors.cyan,
                ])),
        child: Center(
          child: SpinKitThreeInOut(
              size: 100, duration: Duration(seconds: 1), color: Colors.white),
        ),
      ),
    );
  }
}
