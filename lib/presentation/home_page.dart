import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_app/presentation/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/presentation/widgets/custom_background_gradient_color.dart';
import 'package:weather_app/presentation/widgets/date_and_location_widget.dart';
import 'package:weather_app/presentation/widgets/search_location_button.dart';
import 'package:weather_app/presentation/widgets/weather_details_widget.dart';
import 'package:weather_app/presentation/widgets/weather_of_next_days.dart';
import 'package:weather_app/presentation/widgets/weather_of_today_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    context.read<WeatherBloc>().add(FetchWeatherEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomBackgroundGradientColor(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (BuildContext context, state) {
              if (state is WeatherLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is WeatherLoadedState) {
                return const ViewDataWidget();
              }

              if (state is WeatherErrorState) {
                return Center(child: Text(state.message));
              }

              return const Center(child: Text('error'));
            },
          ),
        ),
      ),
    );
  }
}

class ViewDataWidget extends StatelessWidget {
  const ViewDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SearchLocationButton(),
        DateAndLocationWidget(),
        WeatherOfToday(),
        WeatherDetailsWidget(),
        WeatherOfNextDaysWidget(),
      ],
    );
  }
}
