import 'package:greengrocer/src/models/item_model.dart';

class ItemCheckoutModel {
  final ItemModel item;
  final int quantity;

  double get total => item.price * quantity;

  ItemCheckoutModel({
    required this.item,
    required this.quantity,
  });

  ItemCheckoutModel copyWith({
    ItemModel? item,
    int? quantity,
  }) {
    return ItemCheckoutModel(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
    );
  }
}
