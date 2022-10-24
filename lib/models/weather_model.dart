import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    // date = data['location']['localtime'];
    // temp = jsonData['avgtemp_c'];
    // maxTemp = jsonData['maxtemp_c'];
    // minTemp = jsonData['mintemp_c'];
    // weatherStateName = jsonData['condition']['text'];
    return WeatherModel(
        date: DateTime.parse(data['location']['localtime']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }
  // @override
  // String toString() {
  //   return 'temp: $temp , date: $date , MaxTemp: $maxTemp , MinTemp: $minTemp , State: $weatherStateName';
  // }

String getImage()
{
  if( weatherStateName == 'Clear' || weatherStateName == 'Light Cloud')
    {
      return 'assets/images/clear.png';
    }
  else if(weatherStateName == 'Sleet' || weatherStateName == 'Snow' || weatherStateName == 'Hail')
  {
    return 'assets/images/snow.png';
  }
  else if(weatherStateName == 'Heavy Cloud')
  {
    return 'assets/images/cloudy.png';
  }
  else if(weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain' || weatherStateName == 'Showers')
  {
    return 'assets/images/rainy.png';
  }
  else if(weatherStateName == 'Thunder')
  {
    return 'assets/images/thunderstorm.png';
  }
  else
    {
      return 'assets/images/clear.png';
    }
}


  MaterialColor getThemeColor()
  {
    if(weatherStateName == 'Clear' || weatherStateName == 'Light Cloud')
    {
      return Colors.orange;
    }
    else if(weatherStateName == 'Sleet' || weatherStateName == 'Snow' || weatherStateName == 'Hail')
    {
      return Colors.lightBlue;
    }
    else if(weatherStateName == 'Heavy Cloud')
    {
      return Colors.blue;
    }
    else if(weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain' || weatherStateName == 'Showers')
    {
      return Colors.grey;
    }
    else if(weatherStateName == 'Thunder')
    {
      return Colors.blueGrey;
    }
    else
    {
      return Colors.deepOrange;
    }
  }
}
