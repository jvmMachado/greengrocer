import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/components/custom_text_field.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(mask: '###.###.###-##', filter: {
    '#': RegExp(r'[0-9]'),
  });

  final phoneFormatter =
      MaskTextInputFormatter(mask: '## # ####-####', filter: {
    '#': RegExp(r'[0-9]'),
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
          child: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Column(
              children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      'Cadastro',
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(45),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CustomTextField(icon: Icons.email, label: 'Email'),
                      const CustomTextField(
                          icon: Icons.lock, label: 'Senha', hideText: true),
                      const CustomTextField(icon: Icons.person, label: 'Nome'),
                      CustomTextField(
                        icon: Icons.call,
                        label: 'Celular',
                        inputFormatters: [phoneFormatter],
                      ),
                      CustomTextField(
                        icon: Icons.file_copy,
                        label: 'CPF',
                        inputFormatters: [cpfFormatter],
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: const Text(
                            'Cadastrar usuário',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              left: 10,
              top: 10,
              child: SafeArea(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
