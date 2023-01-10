import 'package:cat_dog/data/model/remote/Cat.dart';
import 'package:cat_dog/data/remote/service/cat_service.dart';
import 'package:cat_dog/domain/model/remote/CatImage.dart';
import 'package:cat_dog/domain/repository/cat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../data/repository/cat_repository_imp.dart';
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
