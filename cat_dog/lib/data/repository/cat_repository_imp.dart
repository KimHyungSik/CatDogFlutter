import 'package:cat_dog/data/remote/service/cat_service.dart';
import 'package:cat_dog/domain/model/remote/CatImage.dart';
import 'package:cat_dog/domain/repository/cat_repository.dart';

class CatRepositoryImp implements CatRepository {
  final CatService _catService;

  CatRepositoryImp(this._catService);

  @override
  Future<List<CatImage>> getCatList() async {
    final catResponseList = await _catService.getCatList();
    return catResponseList
        .map((response) => CatImage(id: response.id, imageUrl: response.imgUrl))
        .toList();
  }
}
