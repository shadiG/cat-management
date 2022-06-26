// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum CatKey {
  name,
  catPicture,
}

extension CatKeyExtension on CatKey {
  String get value {
    switch (this) {
      case CatKey.name:
        return 'name';
      case CatKey.catPicture:
        return 'catPicture';
      default:
        throw Exception('Invalid data key.');
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Cat doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'catPicture', doc.catPicture);

  return data;
}

/// For load data
void _$fromData(Cat doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<String?>(data, 'name', defaultValue: null);
  doc.catPicture =
      Helper.valueFromKey<String?>(data, 'catPicture', defaultValue: null);
}
