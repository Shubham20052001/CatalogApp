import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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

  // Remove Items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}
