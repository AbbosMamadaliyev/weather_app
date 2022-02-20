import 'package:weather_app/data/datasource/weather_api_client.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final _apiClient = WeatherApi();

  @override
  Future<WeatherEntity> getWeather(String cityName) async {
    final weather = await _apiClient.getWeather(cityName);
    return weather;
  }
}
