List<Bicycle> globalBicycleList = [];

class Bicycle {
  final String name;
  final int price;
  final int amount;
  final DateTime dateAdded;
  final String description;

  Bicycle({required this.name, required this.price, required this.amount, required this.dateAdded, required this.description});
}