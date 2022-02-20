import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_app/presentation/home_page_model.dart';

class WeatherOfToday extends StatelessWidget {
  const WeatherOfToday({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageModel>();
    final url = model.url('${model.weatherEntity.weather.first.icon}@2x');

    return Expanded(
      flex: 3,
      child: Container(
        height: 240,
        width: 240,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(url),
            Text(
              '${model.weatherEntity.main.temp.toInt()}° C',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              model.weatherEntity.weather[0].description,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
