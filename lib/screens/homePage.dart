import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart'; // Import the intl package for date formatting
import 'package:weatherapp/weather.dart';

class homePage extends StatefulWidget {
  final WeatherData weatherData;
  const homePage({Key? key, required this.weatherData}) : super(key: key);
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late int temperature;
  late Icon weatherDisplayIcon = Icon(Icons
      .error); // Geç başlatma ile değişkeni başlangıçta null olarak başlatıyoruz
  late AssetImage weatherDisplayImage = AssetImage("assets/photos/sunny.png");
  late weatherDisplayData _displayData;
  late String city = "";
  late String dayOfWeek = "";

  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      temperature = weatherData.currentTemperature.round();
      city = weatherData.city;
      _displayData = weatherData.getWeatherDisplayData()!;
      weatherDisplayIcon = _displayData.weatherIcon;
    });
    final now = DateTime.now();
    dayOfWeek = DateFormat('EEEE').format(now);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
              child: Text(
            'Weather in ${city}',
          )),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.indigo,
                Colors.cyan,
              ])),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          city,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: Colors.white)
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(dayOfWeek,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.white70)
                                .copyWith(fontSize: 20)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                          child: Text(
                            "${temperature / 10.toInt()}°",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          right: 5,
                          top: 5,
                        ),
                        weatherDisplayIcon
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),Text("Hourly Weather",style: TextStyle(
                color: Colors.white,fontSize: 15
              ),),
              Container(
                width: 800,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white70,
                borderRadius: BorderRadius.circular(20)),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 80,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 80,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 80,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 80,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 80,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 80,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 80,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 80,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 80,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 80,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 80,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 80,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20,),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
