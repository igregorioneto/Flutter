import 'produto.dart';

class Item {
  Produto produto;
  int quantidade;
  late double _preco;

  Item({
    required this.produto,
    required this.quantidade,
  });

  double get preco {
    _preco = produto.precoComDesconto;
    return _preco;
  }

  void set preco(double novoPreco) {
    _preco = novoPreco;
  }
}
