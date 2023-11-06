class WeatherModel
{
   String cityName ;
   String? image ;
   DateTime date ;
   double temp ;
   double maxTemp ;
   double  minTemp ;
   String weatherCondition ;

  WeatherModel({
    required this.image,
    required this.cityName,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition
  });

  factory WeatherModel.formJson(dynamic data)
  {
     var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        cityName: data['location']['name'],
        date: DateTime.parse(data['current']['last_updated']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherCondition:jsonData['condition']['text'],
      image: jsonData['condition']['icon'],
    );
  }



}