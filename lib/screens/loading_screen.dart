import 'package:flutter/material.dart';
import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/services/weather.dart';




class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {



  var weatherData ;



  double longitude ;
  double latitude ;

  @override
  void initState() {
    getLocationData();
    super.initState();
  }


  void getLocationData() async{

    WeatherModel weatherModel = WeatherModel();
   weatherData = await weatherModel.getLocationWeather();



   print('false');
   Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => LocationScreen(weatherData)),);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: SpinKitRotatingPlain(
          color: Colors.white,
          size: 100,
        ),

      ),
    );
  }
}
