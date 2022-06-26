import 'package:cat_management/data/entities/cat_holder.dart';
import 'package:cat_management/data/entities/featured_cat.dart';
import 'package:cat_management/utils/utils.dart';
import 'package:flamingo/flamingo.dart';

import '../entities/cat.dart';
import '../others/application.dart';

class CatHolderRepository {
  //since we don't have a login process, let's just take a random cat holder as the connected user
  static Future<CatHolder?> getARandomCatHolder() async {
    return await CollectionPaging<CatHolder>(
      query: CatHolder().collectionRef.orderBy('createdAt', descending: true),
      decode: (snap) => CatHolder(snapshot: snap),
    ).load().then(
        (catHolders) => catHolders.isEmpty ? null : catHolders.randomItem());
  }

  static void addACat(CatHolder catHolder, Cat cat) {
    Application.documentAccessor
        ?.save(Cat(collectionRef: catHolder.cats!.ref, snapshot: cat.snapshot));
  }

  static void addAFeaturedCat(CatHolder catHolder, FeaturedCat featuredCat) {
    Application.documentAccessor?.save(FeaturedCat(
        collectionRef: catHolder.collectionRef,
        snapshot: featuredCat.snapshot));
  }
}
