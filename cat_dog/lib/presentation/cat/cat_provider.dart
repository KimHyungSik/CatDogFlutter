import 'package:cat_dog/data/remote/service/cat_service.dart';
import 'package:cat_dog/data/repository/cat_repository_imp.dart';
import 'package:cat_dog/domain/repository/cat_repository.dart';
import 'package:flutter/material.dart';

import '../../domain/model/remote/CatImage.dart';

class CatProvider extends ChangeNotifier {
  CatProvider() {
    loadData();
  }

  CatRepository repository = CatRepositoryImp(CatService());

  List<CatImage> _catList = <CatImage>[];
  List<CatImage> get catList => _catList;

  Future loadData() async {
    final newCatList = await repository.getCatList();
    _catList = newCatList;
    notifyListeners();
  }
}
