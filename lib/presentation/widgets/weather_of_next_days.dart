import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_app/presentation/blocs/weather_bloc/weather_bloc.dart';

class WeatherOfNextDaysWidget extends StatelessWidget {
  const WeatherOfNextDaysWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 32, left: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(36), topLeft: Radius.circular(36)),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'The next 5 days',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 16),
              ViewForecastDailyDataWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ViewForecastDailyDataWidget extends StatelessWidget {
  const ViewForecastDailyDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WeatherBloc>().state as WeatherLoadedState;
    final forecast = state.forecastDailyEntity;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _ForecastDailyCard(
            url: state.imageUrlRepository
                .getImg(forecast.list[8].weather[0].icon),
            day: state.nextDays[0],
            temp: forecast.list[8].main.temp.toInt(),
          ),
          _ForecastDailyCard(
            url: state.imageUrlRepository
                .getImg(forecast.list[17].weather[0].icon),
            day: state.nextDays[1],
            temp: forecast.list[17].main.temp.toInt(),
          ),
          _ForecastDailyCard(
            url: state.imageUrlRepository
                .getImg(forecast.list[25].weather[0].icon),
            day: state.nextDays[2],
            temp: forecast.list[25].main.temp.toInt(),
          ),
          _ForecastDailyCard(
            url: state.imageUrlRepository
                .getImg(forecast.list[32].weather[0].icon),
            day: state.nextDays[3],
            temp: forecast.list[32].main.temp.toInt(),
          ),
          _ForecastDailyCard(
            url: state.imageUrlRepository
                .getImg(forecast.list[39].weather[0].icon),
            day: state.nextDays[4],
            temp: forecast.list[39].main.temp.toInt(),
          ),
        ],
      ),
    );
  }
}

class _ForecastDailyCard extends StatelessWidget {
  final String day;
  final String url;
  final int temp;

  const _ForecastDailyCard(
      {Key? key, required this.url, required this.day, required this.temp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(day),
          Container(
            height: 85,
            width: 75,
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(url),
                Text(
                  '$temp° C',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
