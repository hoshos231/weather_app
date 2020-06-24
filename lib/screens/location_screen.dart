import 'package:flutter/material.dart';
import 'package:weatherapp/screens/city_screen.dart';
import 'package:weatherapp/utilities/constants.dart';
import 'loading_screen.dart';
import 'package:weatherapp/services/weather.dart';
import 'city_screen.dart';


class LocationScreen extends StatefulWidget {



  LocationScreen(this.weatherData);
  final weatherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}






class _LocationScreenState extends State<LocationScreen> {
  
  WeatherModel weatherModel = WeatherModel();

  double temp ;
  int condation;
  String cityName;
  int temprature;
  String message ;

  @override
  void initState() {
    super.initState();

     updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if(weatherData == null){
        temp = 0 ;
        condation = 800;
        cityName = '';
        message = 'Can\'t load current location ';
        return;

      }



      temp= weatherData['main']['temp'];
      condation= weatherData['weather'][0]['id'];
      cityName = weatherData['name'];



      temprature = (temp-273.15).toInt();
      message = weatherModel.getMessage(temprature);

      print (message);

    });

  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/wether.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {

                         updateUI(await weatherModel.getLocationWeather());


                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                       var cityField = await
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreen() ));
                       if(cityField != null){
                         updateUI(await weatherModel.getCityWeather(cityField));
                       }


                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '°$temprature',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherModel.getWeatherIcon(condation),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0,left: 15),
                child: Text(
                 " $message in $cityName",
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//