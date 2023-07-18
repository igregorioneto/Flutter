import 'cliente.dart';
import 'item.dart';

class Venda {
  Cliente cliente;
  List<Item> itens;

  Venda({
    required this.cliente,
    required this.itens,
  });

  double get valorTotal {
    double total = 0;
    /*for (Item i in itens) {
      total += i.quantidade * i.preco;
    }*/

    total = itens
        .map((i) => i.quantidade * i.preco)
        .reduce((value, element) => value + element);

    return total;
  }
}
