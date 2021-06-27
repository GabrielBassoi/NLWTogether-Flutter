import 'package:flutter/material.dart';
import 'package:nlw_together/shared/models/boleto_model.dart';
import 'package:nlw_together/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:nlw_together/shared/widgets/boleto_tile/boleto_tile_widget.dart';

class BoletoListWidget extends StatefulWidget {
  final BoletoListController controller;
  final bool paid;
  final Function ss;
  BoletoListWidget({Key? key, required this.controller, required this.paid, required this.ss})
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
        int index = -1;
        return Column(
          children: boletos.map((e) {
            index = index + 1;
            if (e.paid == widget.paid) {
              return BoletoTileWidget(
                data: e,
                index: index,
                controller: widget.controller,
                ss: widget.ss,
              );
            }
            return Container();
          }).toList(),
        );
      },
    );
  }
}
