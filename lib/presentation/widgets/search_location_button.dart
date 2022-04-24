import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/weather_bloc/weather_bloc.dart';

class SearchLocationButton extends StatelessWidget {
  const SearchLocationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          padding: const EdgeInsets.only(right: 20),
          onPressed: () {
            _showSearchDialog(context);
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showSearchDialog(BuildContext context) {
    final searchController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
            title: const Text('Search location'),
            content: TextField(
              autofocus: true,
              controller: searchController,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context
                      .read<WeatherBloc>()
                      .add(SearchCityEvent(searchController.text));

                  searchController.clear();
                  Navigator.of(context).pop();
                },
                child: const Text('search'),
              ),
            ],
          );
        });
  }
}
