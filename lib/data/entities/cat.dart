import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'cat.flamingo.dart';

class Cat extends Document<Cat> {
  Cat(
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
  String? description;

  @Field()
  String? catPicture;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
