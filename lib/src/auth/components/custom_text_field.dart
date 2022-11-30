import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool hideText;

  const CustomTextField({
    Key? key,
    required this.icon,
    required this.label,
    this.hideText = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isHidden;

  @override
  void initState() {
    super.initState();
    isHidden = widget.hideText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: isHidden,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.hideText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  icon:
                      Icon(isHidden ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
