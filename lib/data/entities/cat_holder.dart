import 'package:cat_management/data/entities/featured_cat.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

import 'cat.dart';

part 'cat_holder.flamingo.dart';

class CatHolder extends Document<CatHolder> {
  CatHolder({
    String? id,
    DocumentSnapshot<Map<String, dynamic>>? snapshot,
    Map<String, dynamic>? values,
  }) : super(id: id, snapshot: snapshot, values: values) {
    cats = Collection(this, CatHolderKey.cats.value);
    featuredCats = Collection(this, CatHolderKey.featuredCats.value);
  }

  @Field()
  String? name;

  @Field()
  int? age;

  @Field()
  String? avatar;

  @SubCollection()
  Collection<Cat>? cats;

  @SubCollection()
  Collection<FeaturedCat>? featuredCats;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
