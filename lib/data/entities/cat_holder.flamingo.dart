// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_holder.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum CatHolderKey {
  name,
  age,
  avatar,

  cats,
  featuredCats,
}

extension CatHolderKeyExtension on CatHolderKey {
  String get value {
    switch (this) {
      case CatHolderKey.name:
        return 'name';
      case CatHolderKey.age:
        return 'age';
      case CatHolderKey.avatar:
        return 'avatar';
      case CatHolderKey.cats:
        return 'cats';
      case CatHolderKey.featuredCats:
        return 'featuredCats';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(CatHolder doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'age', doc.age);
  Helper.writeNotNull(data, 'avatar', doc.avatar);

  return data;
}

/// For load data
void _$fromData(CatHolder doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<String?>(data, 'name', defaultValue: null);
  doc.age = Helper.valueFromKey<int?>(data, 'age', defaultValue: null);
  doc.avatar = Helper.valueFromKey<String?>(data, 'avatar', defaultValue: null);
}
