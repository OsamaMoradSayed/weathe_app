import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {

String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onChanged: (data){
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherServices weatherServices = WeatherServices();
              WeatherModel? weatherData = await weatherServices.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context,listen: false).weatherData = weatherData;
              Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

              Navigator.pop(context);
              //print(weatherData);
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a City',
              labelText: 'Search',
              suffixIcon: GestureDetector(
                onTap: () async{
                  WeatherServices weatherServices = WeatherServices();
                  WeatherModel? weatherData = await weatherServices.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context,listen: false).weatherData = weatherData;
                  Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.search,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0 , vertical:  30.0,)

            ),
          ),
        ),
      ),
    );
  }
}
