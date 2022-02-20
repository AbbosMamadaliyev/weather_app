import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../home_page_model.dart';

class DateAndLocationWidget extends StatelessWidget {
  const DateAndLocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageModel>();
    final weather = model.weatherEntity;

    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Today, ${model.todayDate}',
              style: const TextStyle(color: Colors.white),
            ),
            const Text(
              '',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              weather.name,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
