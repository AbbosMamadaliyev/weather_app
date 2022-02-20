import 'package:weather_app/data/datasource/weather_api_client.dart';

class ImageUrlRepository {
  final _apiClient = WeatherApi();

  String getImg(String icon) => _apiClient.getImgUrl(icon);
}
