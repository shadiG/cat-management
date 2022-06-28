// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_cat.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum FeaturedCatKey {
  name,
  catPicture,
  description,
  specialFeature,
}

extension FeaturedCatKeyExtension on FeaturedCatKey {
  String get value {
    switch (this) {
      case FeaturedCatKey.name:
        return 'name';
      case FeaturedCatKey.catPicture:
        return 'catPicture';
      case FeaturedCatKey.description:
        return 'description';
      case FeaturedCatKey.specialFeature:
        return 'specialFeature';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(FeaturedCat doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'catPicture', doc.catPicture);
  Helper.writeNotNull(data, 'description', doc.description);
  Helper.writeNotNull(data, 'specialFeature', doc.specialFeature);

  return data;
}

/// For load data
void _$fromData(FeaturedCat doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<String?>(data, 'name', defaultValue: null);
  doc.catPicture =
      Helper.valueFromKey<String?>(data, 'catPicture', defaultValue: null);
  doc.description =
      Helper.valueFromKey<String?>(data, 'description', defaultValue: null);
  doc.specialFeature =
      Helper.valueFromKey<String?>(data, 'specialFeature', defaultValue: null);
}
