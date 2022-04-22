import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_app/presentation/home_page_model.dart';
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

    context.read<HomePageModel>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomBackgroundGradientColor(
          child: FutureBuilder(
            future: context.read<HomePageModel>().getWeather(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.purpleAccent),
                );
              } else if (snapshot.hasData) {
                return const ViewDataWidget();
              } else {
                return const Center(
                  child: Text('No data'),
                );
              }
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
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
