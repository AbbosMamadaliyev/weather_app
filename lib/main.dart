import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/home_page_model.dart';

import 'app/my_app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => HomePageModel(),
      child: const MyApp(),
    ),
  );
}
