import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'featured_cat.flamingo.dart';

class FeaturedCat extends Document<FeaturedCat> {
  FeaturedCat(
      {String? id,
      DocumentSnapshot<Map<String, dynamic>>? snapshot,
      Map<String, dynamic>? values,
      CollectionReference<Map<String, dynamic>>? collectionRef})
      : super(
            id: id,
            snapshot: snapshot,
            values: values,
            collectionRef: collectionRef);

  @Field()
  String? name;

  @Field()
  String? catPicture;

  @Field()
  String? description;

  @Field()
  String? specialFeature;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
