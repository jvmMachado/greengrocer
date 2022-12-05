import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/item_checkout_model.dart';
import 'package:greengrocer/src/services/utils_services.dart';

import '../../config/app_data.dart' as appData;
import 'components/item_checkout_card.dart';

class CheckoutTab extends StatefulWidget {
  const CheckoutTab({Key? key}) : super(key: key);

  @override
  State<CheckoutTab> createState() => _CheckoutTabState();
}

class _CheckoutTabState extends State<CheckoutTab> with UtilsServicesMixin {
  List<ItemCheckoutModel> itemsCart = [
    ItemCheckoutModel(item: appData.apple, quantity: 2),
    ItemCheckoutModel(item: appData.grape, quantity: 3),
    ItemCheckoutModel(item: appData.guava, quantity: 5),
    ItemCheckoutModel(item: appData.kiwi, quantity: 1),
  ];

  @override
  Widget build(BuildContext context) {
    double total = 0;
    // ignore: avoid_function_literals_in_foreach_calls
    itemsCart.forEach((item) => total += item.total);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 6, right: 4, left: 4),
              child: ListView.builder(
                itemBuilder: (_, index) {
                  return ItemCheckoutCard(
                    checkoutItem: itemsCart[index],
                    result: (quantity) {
                      setState(() {
                        if (quantity == 0) {
                          itemsCart.removeAt(index);
                          return;
                        }

                        itemsCart[index] =
                            itemsCart[index].copyWith(quantity: quantity);
                      });
                    },
                  );
                },
                itemCount: itemsCart.length,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 20,
                bottom: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Total geral',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    priceToCurrency(total),
                    style: TextStyle(
                      color: CustomColors.customSwatchColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        var result = await showOrderConfirmation();

                        print(result);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: CustomColors.customSwatchColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'Concluir pedido',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text('Confirmação'),
            content: const Text('Deseja realmente concluir o pedido?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Não'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Sim'),
              )
            ],
          );
        });
  }
}
