import 'dart:convert'; // For JSON encoding and decoding
import 'package:floor/floor.dart';
import 'package:products_app/feature/products/domain/entities/review.dart';

class ReviewConverter extends TypeConverter<List<Review>, String> {
  @override
  List<Review> decode(String databaseValue) {
    List<dynamic> jsonList = jsonDecode(databaseValue);
    return jsonList.map((jsonItem) => Review.fromJson(jsonItem)).toList();
  }

  @override
  String encode(List<Review> value) {
    List<Map<String, dynamic>> jsonList = value.map((review) => review.toJson()).toList();
    return jsonEncode(jsonList);
  }
}
