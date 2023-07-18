class Item {
  late String name;
  late double price;

  Item({required this.name, required this.price});
}

class Order {
  late Client client;
  late Item items;

  Order({required this.client, required this.items});
}

class Client {
  late String nome_client;

  Client({required this.nome_client});
}

void main() {
  var item = Item(
    price: 3000,
    name: "Notebook",
  );

  var order = Order(
    client: Client(
      nome_client: "Davi",
    ),
    items: Item(
      name: "Geladeira",
      price: 4000,
    ),
  );

  print(
    "${order.client.nome_client} Nome do produto é ${order.items.name} e o preço é ${order.items.price}",
  );
}
