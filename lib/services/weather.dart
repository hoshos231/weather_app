


import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';





class WeatherModel {


  Future<dynamic> getCityWeather(cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=0e5a96a302deef1d2e741e8b44f2c391'
    );
    var weatherData = await networkHelper.getData();
    return weatherData;

  }


  Future<dynamic> getLocationWeather()async{
    Location location =  Location();
    await location.getCurrentLocation();
    double longitude = location.longitude;
    double latitude = location.latitude;
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/'
        'weather?lat=$latitude&lon=$longitude&appid=0e5a96a302deef1d2e741e8b44f2c391');

    var weatherData =  await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
