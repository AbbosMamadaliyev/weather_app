import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_app/presentation/home_page_model.dart';

class SearchLocationButton extends StatelessWidget {
  const SearchLocationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageModel>();

    return Expanded(
      flex: 1,
      child: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          padding: const EdgeInsets.only(right: 20),
          onPressed: () {
            model.searchController.clear();
            _showSearchDialog(context, model);
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showSearchDialog(BuildContext context, HomePageModel model) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
            title: const Text('Search location'),
            content: TextField(
              autofocus: true,
              controller: model.searchController,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  model.searchByCityName();
                  Navigator.of(context).pop();
                },
                child: const Text('search'),
              ),
            ],
          );
        });
  }
}
