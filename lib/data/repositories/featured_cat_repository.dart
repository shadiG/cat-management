import 'package:cat_management/data/entities/featured_cat.dart';
import 'package:flamingo/flamingo.dart';

import '../entities/cat.dart';

class FeaturedCatRepository {
  // list of all the cats
  static Future<List<FeaturedCat>?> getAll() async {
    return await CollectionPaging<FeaturedCat>(
      query: Cat().collectionRef.orderBy('createdAt', descending: true),
      decode: (snap) => FeaturedCat(snapshot: snap),
    ).load();
  }
}
