import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/pages/search_view.dart';
import 'package:weather/widgets/weather_info_body.dart';

import '../widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text(
          'Weather App'
        ),
        actions: [
          IconButton(
              onPressed: ()
              {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context)
                            {
                              return SearchView();
                            }
                    ));
              },
              icon: const Icon(Icons.search)
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit,WeatherState>(
          builder: (context,state){
            if(state is WeatherInitialState){
              return const NoWeatherBody();
            }
            else if(state is WeatherLoadedState){
              return  WeatherInfoBody(
                weather: state.weatherModel,
              );
            }
            else
            {
              return const Center(child: Text(
                'oops there was an error..!',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                    color: Colors.grey
                ),
              ));
            }
          }
      ),

    );
  }
}

