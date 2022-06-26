import 'package:flamingo/flamingo.dart';

import '../entities/cat.dart';

class CatRepository {
  // list of all the cats
  static Future<List<Cat>?> getAll() async {
    return await CollectionPaging<Cat>(
      query: Cat().collectionRef.orderBy('createdAt', descending: true),
      decode: (snap) => Cat(snapshot: snap),
    ).load();
  }
}
