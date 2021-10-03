import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  // Making class as Singleton
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  // catalog fields
  CatalogModel _catalog = CatalogModel();

  // Collection of IDs = store IDs of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModel get catalog => _catalog;

  // Set Catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get Total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Items
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove Items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
