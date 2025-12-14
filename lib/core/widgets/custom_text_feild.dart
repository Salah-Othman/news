import 'package:flutter/material.dart';

class CustomTextFeild extends StatefulWidget {
  const CustomTextFeild({
    super.key,
    required this.text,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });
  final String text, hintText;
  final TextEditingController controller;
  final bool obscureText;

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(20, 20, 20, 1),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText && !isVisible,
          style: TextStyle(
            color: Color.fromRGBO(54, 54, 54, 1),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: isVisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
