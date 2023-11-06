import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
class SearchView extends StatelessWidget {
  //const SearchView({super.key});

   String? cityName  ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  const Text(
            'Search a City'
        ),
        ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            onSubmitted: (value)async
            {
             var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
               getWeatherCubit.getCurrentWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration:  const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 16),
              border: OutlineInputBorder(),
              label: Text(
                'Search'
              ),
              hintText: 'Enter City Name',
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
