
import 'package:get_it/get_it.dart';
import 'package:products_app/feature/cart/presentation/bloc/buttonNavigation/bottom_nav_bloc.dart';
import 'package:products_app/feature/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:products_app/feature/products/data/datasource/database/app_database.dart';
import 'package:products_app/feature/products/data/datasource/remote/products_remote_datasource.dart';
import 'package:products_app/feature/products/data/datasource/remote/products_remote_datasource_impl.dart';
import 'package:products_app/feature/products/data/repository/product_repository_impl.dart';
import 'package:products_app/feature/products/domain/repository/products_repository.dart';
import 'package:products_app/feature/products/domain/usecases/get_product_usecase.dart';
import 'package:products_app/feature/products/domain/usecases/get_saved_products.dart';
import 'package:products_app/feature/products/domain/usecases/remove_article.dart';
import 'package:products_app/feature/products/domain/usecases/save_article.dart';

import '../shared/dio_network_service.dart';
import '../shared/network_service.dart';

final injector  = GetIt.instance;

Future<void>  setUp() async{
  final database =
  await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  injector.registerSingleton<AppDatabase>(database);
  injector.registerLazySingleton<NetworkService>(() => DioNetworkService());
}

void provideDataSources(){
  injector.registerFactory<ProductsRemoteDataSource>(
          () => ProductsRemoteDataSourceImpl(injector.get<NetworkService>()));
}


void provideRepositories(){
  injector.registerFactory<ProductRepository>(() =>
      ProductRepositoryImpl(injector.get<ProductsRemoteDataSource>(), injector()));
}

void provideUseCases(){
  injector.registerFactory<GetProductUseCase>(() => GetProductUseCase(injector.get<ProductRepository>()));
  injector.registerFactory<GetSavedProductUseCase>(() => GetSavedProductUseCase(injector.get<ProductRepository>()));
  injector.registerFactory<SaveProductUseCase>(() => SaveProductUseCase(injector.get<ProductRepository>()));
  injector.registerFactory<RemoveProductUseCase>(() => RemoveProductUseCase(injector.get<ProductRepository>()));
}


void provideBlocs(){
  injector.registerFactory<CartBloc>(() => CartBloc(injector() , injector() , injector()));
  injector.registerFactory<BottomNavBloc>(() => BottomNavBloc());

}


