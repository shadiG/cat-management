import 'package:cat_management/data/others/main_list_notifier.dart';
import 'package:cat_management/data/repositories/cat_holder_repository.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../data/entities/cat.dart';
import '../data/entities/cat_holder.dart';
import '../data/entities/featured_cat.dart';

class HomeTabController {
  static List<FeaturedCat>? processChangedFeaturedCatList(
      AsyncSnapshot<QuerySnapshot> snapshot) {
    List<FeaturedCat>? featuredCats = snapshot.data?.docs
        .map((e) =>
            FeaturedCat(id: e.id, values: e.data() as Map<String, dynamic>))
        .toList();

    return featuredCats;
  }

  static List<Cat>? processChangedCatList(
      AsyncSnapshot<QuerySnapshot> snapshot) {
    List<Cat>? cats = snapshot.data?.docs
        .map((e) => Cat(id: e.id, values: e.data() as Map<String, dynamic>))
        .toList();

    return cats;
  }

  static void addACat(CatHolder catHolder, Cat cat, BuildContext context) {
    CatHolderRepository.addACat(catHolder, cat);
    //let's notify the main list that the state has been changed
    context.read<MainListNotifier>().notify();
  }

  static void addAFeaturedCat(
      CatHolder catHolder, FeaturedCat featuredCat, BuildContext context) {
    CatHolderRepository.addAFeaturedCat(catHolder, featuredCat);
    //let's notify the main list that the state has been changed
    context.read<MainListNotifier>().notify();
  }

  static void removeACat(CatHolder catHolder, Cat cat, BuildContext context) {
    CatHolderRepository.removeACat(catHolder, cat);
    //let's notify the main list that the state has been changed
    context.read<MainListNotifier>().notify();
  }

  static void removeAFeaturedCat(
      CatHolder catHolder, FeaturedCat featuredCat, BuildContext context) {
    CatHolderRepository.removeAFeaturedCat(catHolder, featuredCat);
    //let's notify the main list that the state has been changed
    context.read<MainListNotifier>().notify();
  }
}
