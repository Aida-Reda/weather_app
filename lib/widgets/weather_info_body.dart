import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/main.dart';

import '../models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather,});

  final WeatherModel weather ;
  @override
  Widget build(BuildContext context) {
     WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel! ;
    return  Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weather.weatherCondition),
            getThemeColor(weather.weatherCondition)[300]!,
            getThemeColor(weather.weatherCondition)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
           children:[
              Text(
            weatherModel.cityName,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black ,
          ),
        ),
                Text(
               'update at ${weatherModel.date.hour}:${weatherModel.date.minute}',
             style:  TextStyle(
               color:Colors.black.withOpacity(.8),
               fontSize: 22,
               fontWeight: FontWeight.w500
             ),
           ),
             const SizedBox(height: 12,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Image.network(
                    'https:${weatherModel.image}'
                 ),
                    Text(
                   '${weatherModel.temp.round()}',
                   style: const TextStyle(
                     fontSize: 32,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 Column(
                   children:[
                     Text(
                       'maxTemp :${weatherModel.maxTemp.round()}',
                       style: const TextStyle(
                         color: Colors.black,
                         fontSize: 14,
                       ),
                     ),
                     Text(
                       'minTemp :${weatherModel.minTemp.round()}',
                       style: const TextStyle(
                         color: Colors.black,
                         fontSize: 14,
                       ),
                     ),
                   ],
                 ),
               ],
             ),
             const SizedBox(height: 12,),
              Text(
                weatherModel.weatherCondition,
               style: const TextStyle(
                 fontSize: 28,
                 fontWeight: FontWeight.bold,
                 color: Colors.black ,
               ),
             ),
           ],
        ),
      ),
    );
  }
}

