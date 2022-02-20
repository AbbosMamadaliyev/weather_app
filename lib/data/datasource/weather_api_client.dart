import 'package:dio/dio.dart';
import 'package:weather_app/domain/entities/forecast_daily_entity.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';

class WeatherApi {
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5';
  final String _imgUrl = 'http://openweathermap.org/img/wn/';
  final String _param1 = '/weather';
  final String _param2 = '/forecast';
  final String _query = '?q=';
  final String _appid = '&appid=';
  final String _apiKey = 'd1fd3ca6836418df2c335353aa1b0a64';
  final String _units = '&units=metric';
  final String _lang = '&lang=ru';

  String getImgUrl(String icon) => '$_imgUrl$icon.png';

  final dio = Dio();

  Future<WeatherEntity> getWeather(String cityName) async {
    final response = await dio.get(_makePath(cityName, _param1));
    final request = WeatherEntity.fromJson(response.data);

    return request;
  }

  Future<ForecastDailyEntity> getForecastDaily(String cityName) async {
    final response = await dio.get(_makePath(cityName, _param2));
    final request = ForecastDailyEntity.fromJson(response.data);

    return request;
  }

  String _makePath(String cityName, String param) =>
      '$_baseUrl$param$_query$cityName$_appid$_apiKey$_units$_lang';
}

// api.openweathermap.org/data/2.5/forecast?q={city name}&appid={API key}
// https://api.openweathermap.org/data/2.5/forecast?q=tashkent&appid=d1fd3ca6836418df2c335353aa1b0a64
//

// api.openweathermap.org/data/2.5/weather?q=tashkent&appid=d1fd3ca6836418df2c335353aa1b0a64
// api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

// pro.openweathermap.org/data/2.5/forecast/hourly?q=tashkent&appid=d1fd3ca6836418df2c335353aa1b0a64

// https://api.openweathermap.org/data/2.5/onecall?q=tashkent&exclude=daily&appid=d1fd3ca6836418df2c335353aa1b0a64

// api.openweathermap.org/data/2.5/forecast?q=tashkent&appid=d1fd3ca6836418df2c335353aa1b0a64
