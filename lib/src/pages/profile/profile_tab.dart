import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/common_components/custom_text_field.dart';
import 'package:greengrocer/src/services/utils_services.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> with UtilsServicesMixin {
  var user = appData.user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [
          IconButton(
              icon: const Icon(Icons.exit_to_app_outlined), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  icon: Icons.email,
                  label: 'Email',
                  initialValue: user.email,
                  readOnly: true,
                ),
                CustomTextField(
                  icon: Icons.person,
                  label: 'Nome',
                  initialValue: user.name,
                  readOnly: true,
                ),
                CustomTextField(
                  icon: Icons.call,
                  label: 'Celular',
                  inputFormatters: [UtilsServicesMixin.phoneFormatter],
                  initialValue: user.phone,
                  readOnly: true,
                ),
                CustomTextField(
                  icon: Icons.file_copy,
                  label: 'CPF',
                  inputFormatters: [UtilsServicesMixin.cpfFormatter],
                  initialValue: user.cpf,
                  readOnly: true,
                ),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.green,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      showPasswordUpdate();
                    },
                    child: const Text(
                      'Atualizar senha',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showPasswordUpdate() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            // contentPadding: const EdgeInsets.fromLTRB(14, 24, 12, 14),
            // title: const Text(
            //   'Atualização de senha',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            // ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 24, 12, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Atualização de senha',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      const CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha atual',
                        hideText: true,
                      ),
                      const CustomTextField(
                        icon: Icons.lock_outline,
                        label: 'Nova senha',
                        hideText: true,
                      ),
                      const CustomTextField(
                        icon: Icons.lock_outline,
                        label: 'Confirmar nova senha',
                        hideText: true,
                      ),
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Atualizar',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                )
              ],
            ),
          );
        });
  }
}
