import '../venda_produtos/cliente.dart';
import '../venda_produtos/item.dart';
import '../venda_produtos/produto.dart';
import '../venda_produtos/venda.dart';

void main() {
  var venda = Venda(
    cliente: Cliente(
      nome: "João",
      cpf: "000.000.000-00",
    ),
    itens: <Item>[
      Item(
        produto: Produto(
          codigo: 10,
          nome: "Notebook",
          preco: 3000,
          desconto: 0.2,
        ),
        quantidade: 5,
      ),
      Item(
        produto: Produto(
          codigo: 15,
          nome: "Geladeira",
          preco: 5000,
          desconto: 0.5,
        ),
        quantidade: 5,
      ),
    ],
  );

  print("O Valor total da compra é: ${venda.valorTotal}");
}
