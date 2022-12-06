import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

mixin UtilsServicesMixin {
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return numberFormat.format(price);
  }

  static final cpfFormatter =
      MaskTextInputFormatter(mask: '###.###.###-##', filter: {
    '#': RegExp(r'[0-9]'),
  });

  static final phoneFormatter =
      MaskTextInputFormatter(mask: '## # ####-####', filter: {
    '#': RegExp(r'[0-9]'),
  });
}
