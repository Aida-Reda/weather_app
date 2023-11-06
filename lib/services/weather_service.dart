import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService{
  final Dio dio ;
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '2775224d0d6842858f3131454231907';
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather  ({required String cityName})async
   {
     try{
       Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.formJson(response.data);
      return weatherModel ;

    } on DioException catch(e)
       {
         print('ERROR................');
         final String errorMessage = e.response?.data['error']['message'] ;
            throw Exception(errorMessage);
       }catch (e)
     {
         log(e.toString());
       throw Exception('oops there was an error ,try later..');
     }

  }



}