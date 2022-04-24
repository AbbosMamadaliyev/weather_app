import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../blocs/weather_bloc/weather_bloc.dart';

class WeatherOfToday extends StatelessWidget {
  const WeatherOfToday({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final state = context.watch<WeatherBloc>().state as WeatherLoadedState;
    final weatherEntity = state.weatherEntity;

    return Expanded(
      flex: 3,
      child: Container(
        height: size.height * 0.2,
        width: size.width * 0.5,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                state.imageUrlRepository
                    .getImg('${weatherEntity.weather.first.icon}@2x'),
              ),
              Text(
                '${weatherEntity.main.temp.toInt()}° C',
                style: TextStyle(
                  fontSize: size.height * 0.05,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                weatherEntity.weather[0].description,
                style: TextStyle(
                  fontSize: size.height * 0.02,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
