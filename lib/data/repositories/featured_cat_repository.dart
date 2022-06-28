import 'package:cat_management/data/entities/featured_cat.dart';
import 'package:flamingo/flamingo.dart';

import '../others/application.dart';

class FeaturedCatRepository {
  // list of all the cats
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAll() {
    return firestoreInstance
        .collection(FeaturedCat().collectionPath)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>>? getHisFeaturedCat() {
    return Application.catHolder != null
        ? firestoreInstance
            .collection(Application.catHolder!.featuredCats!.ref.path)
            .snapshots()
        : null;
  }

  // check if the corresponding featured cat belongs to the catHolder
  static Future<bool> isHisFeaturedCat(FeaturedCat featuredCat) async {
    List<FeaturedCat> featuredCats = await CollectionPaging<FeaturedCat>(
      query: Application.catHolder!.featuredCats!.ref
          .orderBy('createdAt', descending: true),
      decode: (snap) => FeaturedCat(snapshot: snap),
    ).load();
    return featuredCats.where((e) => e.id == featuredCat.id).isNotEmpty;
  }
}
