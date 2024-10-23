class Item {
  final String name;
  final int price;
  Item({required this.name, required this.price});
  @override
  String toString() {
    return 'Item(name: $name, price: $price)';
  }
}