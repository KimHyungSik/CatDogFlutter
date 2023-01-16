import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cat_provider.dart';

class CatListScreen extends StatelessWidget {
  late CatProvider _catProvider;

  @override
  Widget build(BuildContext context) {
    _catProvider = Provider.of<CatProvider>(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: _catProvider.catList.length,
        itemBuilder: (context, index) {
          if (_catProvider.catList[index].imageUrl != null) {
            return Image.network(_catProvider.catList[index].imageUrl!);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
