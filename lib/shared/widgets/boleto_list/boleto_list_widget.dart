import 'package:flutter/material.dart';
import 'package:nlw_together/shared/models/boleto_model.dart';
import 'package:nlw_together/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:nlw_together/shared/widgets/boleto_tile/boleto_tile_widget.dart';

class BoletoListWidget extends StatefulWidget {
  final BoletoListController controller;
  final bool paid;
  BoletoListWidget({Key? key, required this.controller, required this.paid})
      : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  int index = -1;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
      valueListenable: widget.controller.boletosNotifier,
      builder: (_, boletos, __) {
        widget.controller.notPaidLenghtNotifier.value = 0;
        widget.controller.paidLenghtNotifier.value = 0;
        return Column(
          children: boletos.map((e) {
            print(e.toString());
            index++;
            if (e.paid == widget.paid) {
              if (e.paid == false) {
                widget.controller.notPaidLenghtNotifier.value++;
              } else {
                widget.controller.paidLenghtNotifier.value++;
              }
              return BoletoTileWidget(
                data: e,
                index: index,
                controller: widget.controller,
              );
            }
            return Container();
          }).toList(),
        );
      },
    );
  }
}
