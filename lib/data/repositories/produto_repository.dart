import 'dart:convert';

import 'package:consumindo_api_flutter/data/http/http.dart';
import 'package:consumindo_api_flutter/data/models/models.dart';
import 'package:consumindo_api_flutter/data/repositories/repositories.dart';

class ProdutoRepository implements ProdutoRepositoryAbstract {
  final IHttpcliente client;

  ProdutoRepository({required this.client});

  @override
  Future<List<ProdutoModel>> getProdutos() async {
    final response = await client.get(url: 'https://dummyjson.com/products');

    if (response.statusCode == 200) {
      final List<ProdutoModel> produtos = [];

      final body = jsonDecode(response.body);

      body['products'].map((item) {
        final ProdutoModel produto = ProdutoModel.fromMap(item);
        produtos.add(produto);
      }).toList();

      return produtos;
    } else if (response.statusCode == 404) {
      throw NotFoundException(message: 'A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar os produtos');
    }
  }
}
