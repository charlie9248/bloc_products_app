import 'package:floor/floor.dart';
import 'dart:convert';

import 'package:products_app/feature/products/domain/entities/dimensions.dart'; // For JSON encoding and decoding

class DimensionsConverter extends TypeConverter<Dimensions, String> {
  @override
  Dimensions decode(String databaseValue) {
    final Map<String, dynamic> jsonMap = jsonDecode(databaseValue);
    return Dimensions.fromJson(jsonMap);
  }

  @override
  String encode(Dimensions value) {
    final String jsonString = jsonEncode(value.toJson());
    return jsonString;
  }
}