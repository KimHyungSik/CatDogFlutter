import 'package:cat_dog/data/model/remote/Cat.dart';
import 'package:cat_dog/data/remote/service/cat_service.dart';
import 'package:cat_dog/domain/model/remote/CatImage.dart';
import 'package:cat_dog/domain/repository/cat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../data/repository/cat_repository_imp.dart';

class CatListScreen extends StatelessWidget {
  CatListScreen({super.key}) {
    loadData();
  }

  CatRepository repository = CatRepositoryImp(CatService());
  List<CatImage> catList = <CatImage>[];

  Future loadData() async {
    catList = await repository.getCatList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: catList.length,
        itemBuilder: (context, index) {
          if (catList[index].imageUrl != null) {
            return Image.network(catList[index].imageUrl!);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
