import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_task/core/cache/sql_helper.dart';
import 'package:flutter_task/features/home/data/models/categories_image_model.dart';
import 'package:flutter_task/features/home/data/models/product_model.dart';
import 'package:flutter_task/features/home/logic/cubit/home_state.dart';
import 'package:flutter_task/gen/locale_keys.g.dart';
import 'package:flutter_task/generate/assets.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int offerIndex = 0;
  void changeOfferIndex(int index) {
    offerIndex = index;
    emit(HomeChangeOfferIndex());
  }

  List<ProductModel> products = [];
  List<CategoriesImageModel> categoriesImages = [];
  void getProducts() async {
    emit(HomeGetProductsLoading());
    try {
      final productsFromDB = await SqlHelper().getData(tableName: 'products');
      products = productsFromDB.map((e) => ProductModel.fromMap(e)).toList();
      final categoriesImagesFromDB = await SqlHelper().getData(
        tableName: 'categories_images',
      );
      categoriesImages = categoriesImagesFromDB
          .map((e) => CategoriesImageModel.fromMap(e))
          .toList();
      print(categoriesImages);
      emit(HomeGetProductsSuccess());
    } catch (e) {
      emit(HomeGetProductsError(message: e.toString()));
    }
  }

  // final List<ProductModel> products = [
  //   ProductModel(
  //     image: Assets.assetsImagesProductsShoes,
  //     title: 'حذاء رياضي',
  //     oldPrice: '2500 جنيه',
  //     newPrice: '1999 جنيه',
  //     sold: '3.3k تم البيع',
  //   ),
  //   ProductModel(
  //     image: Assets.assetsImagesProductsSweetShirt,
  //     title: 'سويت شيرت شتوي',
  //     oldPrice: '800 جنيه',
  //     newPrice: '650 جنيه',
  //     sold: '2.1k تم البيع',
  //   ),
  //   ProductModel(
  //     image: Assets.assetsImagesProductsShrit,
  //     title: 'قميص كلاسيك رجالي',
  //     oldPrice: '600 جنيه',
  //     newPrice: '450 جنيه',
  //     sold: '1.7k تم البيع',
  //   ),
  //   ProductModel(
  //     image: Assets.assetsImagesCategoriesImagesWatch,
  //     title: 'ساعة يد أنيقة',
  //     oldPrice: '1800 جنيه',
  //     newPrice: '1450 جنيه',
  //     sold: '4.2k تم البيع',
  //   ),
  //   ProductModel(
  //     image: Assets.assetsImagesProductsSweetShirt,
  //     title: 'جاكيت جلد فاخر',
  //     oldPrice: '2200 جنيه',
  //     newPrice: '1899 جنيه',
  //     sold: '2.9k تم البيع',
  //   ),
  // ];
  // // void insertProducts() {
  // //   for (var product in products) {
  // //     SqlHelper().insertData(data: product.toMap(), tableName: 'products');
  // //     SqlHelper().getData(tableName: 'products').then((value) {
  // //       print(value);
  // //     });
  // //   }
  // //   emit(HomeInsertProducts());
  // // }
  //  void insertCategoriesImages() async {
  //   try {
  //     for (var categoryImage in categoriesImages) {
  //       await SqlHelper().insertData(
  //         tableName: 'categories_images',
  //         data: categoryImage.toMap(),
  //       );
  //     }
  //     print('categories_images inserted successfully');
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
