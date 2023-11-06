import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/pages/home_view.dart';

import 'cubits/get_weather_cubit/bloc_observer.dart';
void main()
{
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>GetWeatherCubit(),
      child:   Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit , WeatherState >(
            builder:(context,state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch:
                  getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel?.weatherCondition),
                ),
                home: const HomeView(),
              ) ;
            }
        )

      ),
    );
  }

}

MaterialColor getThemeColor(String? condition) {
  if(condition == null){
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.yellow;
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
    case 'Patchy rain possible':
      return Colors.indigo;
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.green;
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
    case 'Patchy sleet possible':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Blizzard':
    case 'Blowing snow':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}

