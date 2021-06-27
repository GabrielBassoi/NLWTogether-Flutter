import 'package:flutter/material.dart';
import 'package:nlw_together/shared/models/boleto_model.dart';
import 'package:nlw_together/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:nlw_together/shared/widgets/boleto_tile/boleto_tile_widget.dart';
import 'package:nlw_together/shared/widgets/empty_list/empty_list.dart';

class BoletoListWidget extends StatefulWidget {
  final BoletoListController controller;
  final bool paid;
  BoletoListWidget({Key? key, required this.controller, required this.paid})
      : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
      valueListenable: widget.controller.boletosNotifier,
      builder: (_, boletos, __) {
        widget.controller.notPaidLenghtNotifier.value = 0;
        widget.controller.paidLenghtNotifier.value = 0;
        int index = -1;
        return Column(
          children: boletos.map((e) {
            index = index + 1;
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
