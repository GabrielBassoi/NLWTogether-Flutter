import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:nlw_together/shared/models/boleto_model.dart';
import 'package:nlw_together/shared/themes/app_text_styles.dart';
import 'package:nlw_together/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:nlw_together/shared/widgets/show_bottom_sheet/show_bottom_sheet.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel data;
  final BoletoListController controller;
  final int index;
  final Function ss;

  const BoletoTileWidget({
    Key? key,
    required this.data,
    required this.index,
    required this.controller,
    required this.ss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: ListTile(
        onLongPress: () {},
        onTap: () {
          showBottomSheetWidget(
            context,
            data,
            data.paid! ? " não foi" : " foi",
            data.paid!
                ? () {
                    controller.setBoletIsPaid(index, false);
                    Navigator.pop(context);
                  }
                : () {
                    controller.setBoletIsPaid(index, true);
                    Navigator.pop(context);
                  },
            () {
              controller.deleteBoleto(index);
              Navigator.pop(context);
            },
            ss,
          );
        },
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.name!,
          style: TextStyles.titleListTile,
        ),
        subtitle: data.paid!
            ? null
            : Text(
                "Vence em ${data.dueDate}",
                style: TextStyles.captionBody,
              ),
        trailing: Text.rich(TextSpan(
          text: "R\$ ",
          style: TextStyles.trailingRegular,
          children: [
            TextSpan(
              text: "${data.value!.toStringAsFixed(2)}",
              style: TextStyles.trailingBold,
            ),
          ],
        )),
      ),
    );
  }
}
