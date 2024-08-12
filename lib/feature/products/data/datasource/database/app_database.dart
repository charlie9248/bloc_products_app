import 'dart:async';

import 'package:floor/floor.dart';
import 'package:products_app/feature/products/data/datasource/local/DAO/products_dao.dart';
import 'package:products_app/feature/products/data/datasource/local/typeconverters/dimensions_converter.dart';
import 'package:products_app/feature/products/data/datasource/local/typeconverters/review_converter.dart';
import 'package:products_app/feature/products/data/datasource/local/typeconverters/tags_converters.dart';
import 'package:products_app/feature/products/domain/entities/product.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';


@TypeConverters([StringListConverter ,  DimensionsConverter  ,  ReviewConverter])
@Database(version: 1, entities: [Product])
abstract class AppDatabase extends FloorDatabase {

  ProductDao get productDAO;

}