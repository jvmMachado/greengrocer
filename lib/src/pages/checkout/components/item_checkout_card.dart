import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/item_checkout_model.dart';
import 'package:greengrocer/src/services/utils_services.dart';

import '../../common_components/quantity_widget.dart';

class ItemCheckoutCard extends StatelessWidget with UtilsServicesMixin {
  final ItemCheckoutModel checkoutItem;
  final Function(int quantity) result;

  const ItemCheckoutCard({
    Key? key,
    required this.checkoutItem,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      elevation: 1,
      shadowColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Image.asset(
          checkoutItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          checkoutItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          priceToCurrency(checkoutItem.quantity * checkoutItem.item.price),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: CustomColors.customSwatchColor,
          ),
        ),
        trailing: QuantityWidget(
          value: checkoutItem.quantity,
          unit: checkoutItem.item.unit,
          result: (quantity) {
            result(quantity);
          },
          isCheckout: true,
        ),
      ),
    );
  }
}

// SizedBox(
//           height: 50,
//           child: Row(
//             children: [
//               SizedBox(
//                 width: 50,
//                 child: Image.asset(checkoutItem.item.imgUrl),
//               ),
//               const SizedBox(
//                 width: 12,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     checkoutItem.item.itemName,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 2,
//                   ),
//                   Text(
//                     priceToCurrency(
//                         checkoutItem.quantity * checkoutItem.item.price),
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: CustomColors.customSwatchColor,
//                     ),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               QuantityWidget(
//                 value: checkoutItem.quantity,
//                 unit: checkoutItem.item.unit,
//                 result: (quantity) {
//                   result(quantity);
//                 },
//                 isCheckout: true,
//               ),
//             ],
//           ),
//         ),