import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              children: [
                Icon(Icons.ac_unit),
                Text("Voce nao tem nenhum boleto")
              ],
            ),
          ),
        )
      ],
    );
  }
}
