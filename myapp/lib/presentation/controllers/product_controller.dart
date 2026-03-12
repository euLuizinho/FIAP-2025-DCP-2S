import 'package:flutter/widgets.dart';
import 'package:myapp/domain/entities/product_entity.dart';
import 'package:myapp/domain/usecases/get_product_use_case.dart';

class ProductController extends ChangeNotifier{
  final GetProductUseCase _getProductUseCase;
  List<ProductEntity> _products = [];
  bool isLoading = false;
  String? error;

  ProductController(this._getProductUseCase);

  List<ProductEntity> get products => _products;

  Future<void> fetchProducts() async{
    try{
      isLoading = true;
      _products = await _getProductUseCase.execute();
      error = null;
    }catch(e){
      error = "Ops! Falha aos buscar os produtos :(";
    }finally{
      isLoading = false;
      notifyListeners();
    }
  }

}