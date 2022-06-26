import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'cat_holder.flamingo.dart';

class CatHolder extends Document<CatHolder> {
  CatHolder({
    String? id,
    DocumentSnapshot<Map<String, dynamic>>? snapshot,
    Map<String, dynamic>? values,
  }) : super(id: id, snapshot: snapshot, values: values);

  @Field()
  String? name;

  @Field()
  int? age;

  @Field()
  String? avatar;

  @override
  Map<String, dynamic> toData() => _$toData(this);

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
