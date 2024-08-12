
import 'package:floor/floor.dart';
import 'package:products_app/feature/products/domain/entities/product.dart';

@dao
abstract class ProductDao {


  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertProduct (Product product);


  @delete
  Future<void> deleteArticle (Product product);

  @Query("SELECT * FROM product")
  Future<List<Product>> getProducts();

}