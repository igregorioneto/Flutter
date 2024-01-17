import 'package:flutter/material.dart';
import 'package:produtos_consumindo_api/app/data/http/exceptions.dart';
import 'package:produtos_consumindo_api/app/data/models/produto_model.dart';
import 'package:produtos_consumindo_api/app/data/repositories/produto_repository.dart';

class ProdutoStore {
  final IProdutoRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<ProdutoModel>> state =
      ValueNotifier<List<ProdutoModel>>([]);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  ProdutoStore({required this.repository});

  Future getProdutos() async {
    isLoading.value = true;

    try {
      final result = await repository.getProdutos();
      state.value = result;
    } on NotFoundException catch (e) {
      error.value = e.message;
      print(error.value);
    } catch (e) {
      error.value = e.toString();
      print(error.value);
    }

    isLoading.value = false;
  }
}
