import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';


const ApiKey = '03b51151c5391a8d5decaf0559ae685e';
const OpenWeatheMap = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  double latitude ;
  double longtude ;

  Future<dynamic> getcityWeather(String cityname) async{
    var url = '$OpenWeatheMap?q=$cityname&appid=$ApiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    longtude = location.longitude;
    latitude = location.latitude;
    NetworkHelper networkHelper = NetworkHelper('$OpenWeatheMap?lat=$latitude&lon=$longtude&appid=$ApiKey&units=metric');
    var weatherData = await networkHelper.getData();
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
