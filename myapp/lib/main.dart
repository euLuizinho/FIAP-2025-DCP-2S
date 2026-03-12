import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/core/custom_http_client.dart';
import 'package:myapp/data/datasources/product_datasource.dart';
import 'package:myapp/data/repositories/product_repository_impl.dart';
import 'package:myapp/domain/usecases/get_product_use_case.dart';
import 'package:myapp/presentation/controllers/product_controller.dart';
import 'package:myapp/presentation/pages/product_page.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final httpClient = CustomHttpClient();
    final productDatasource = ProductDatasource(httpClient);
    final productRepository = ProductRepositoryImpl(productDatasource);
    final getProductUseCase = GetProductUseCase(productRepository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ProductController(getProductUseCase))
      ],
      child: MaterialApp(
        title: 'Consumo de API Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const ProductPage(),
      ),
    );
  }
}
