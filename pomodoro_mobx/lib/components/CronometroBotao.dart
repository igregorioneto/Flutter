import 'package:flutter/material.dart';

class CronometroBotao extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function()? click;

  const CronometroBotao({
    super.key,
    required this.texto,
    required this.icone,
    this.click,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: click,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icone,
              size: 35,
              color: Colors.white,
            ),
          ),
          Text(
            texto,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        textStyle: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
