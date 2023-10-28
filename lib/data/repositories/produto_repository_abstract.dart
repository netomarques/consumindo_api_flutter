import 'package:consumindo_api_flutter/data/models/models.dart';

abstract class ProdutoRepositoryAbstract {
  Future<List<ProdutoModel>> getProdutos();
}
