import '../model/remote/CatImage.dart';

abstract class CatRepository {
  Future<List<CatImage>> getCatList();
}
