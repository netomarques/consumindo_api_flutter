import 'package:consumindo_api_flutter/data/http/http.dart';
import 'package:consumindo_api_flutter/data/models/models.dart';
import 'package:consumindo_api_flutter/data/repositories/repositories.dart';
import 'package:flutter/material.dart';

class ProdutoStore {
  final ProdutoRepositoryAbstract repository;

  // variável reativa para o loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // variável reativa para o state
  final ValueNotifier<List<ProdutoModel>> state =
      ValueNotifier<List<ProdutoModel>>([]);

  // Variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  ProdutoStore({required this.repository});

  getProdutos() async {
    isLoading.value = true;

    try {
      final result = await repository.getProdutos();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      debugPrint(e.toString());
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}
