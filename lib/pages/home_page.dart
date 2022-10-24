import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';


class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
   WeatherModel? weatherData;
   String? cityName;
   @override
  Widget build(BuildContext context) {
     weatherData= Provider.of<WeatherProvider>(context).weatherData;
     cityName= Provider.of<WeatherProvider>(context).cityName;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SearchPage();
              }));
            },
            icon: Icon(Icons.search),)
        ],
        title: Text('Weather App'),
      ),
      body: weatherData == null ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 25,
              ),
            )
          ],
        ),
      ) : Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              weatherData!.getThemeColor(),
              weatherData!.getThemeColor()[300]!,
              weatherData!.getThemeColor()[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Spacer(flex: 2,),
            Text(
              cityName ?? '',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Updated at  ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()} '   ,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                Image.asset(weatherData!.getImage()),
                Text(
                  weatherData?.temp.toInt().toString() ?? '',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children:
                  [
                    Text(
                      'Max: ${weatherData?.maxTemp.toInt()}',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      'Min: ${weatherData?.minTemp.toInt()}',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),


              ],
            ),
            Spacer(),
            Text(
              weatherData?.weatherStateName ?? '',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 5,),

          ],
        ),
      ),
    );
  }
}
