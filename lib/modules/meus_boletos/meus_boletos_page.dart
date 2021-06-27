import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:nlw_together/shared/models/boleto_model.dart';
import 'package:nlw_together/shared/themes/app_colors.dart';
import 'package:nlw_together/shared/themes/app_text_styles.dart';
import 'package:nlw_together/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:nlw_together/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:nlw_together/shared/widgets/boleto_list/boleto_list_widget.dart';
import 'package:nlw_together/shared/widgets/empty_list/empty_list.dart';

class MeusBoletosPage extends StatefulWidget {
  MeusBoletosPage({Key? key}) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          children: [
            Stack(
              children: [
                AnimatedCard(
                  direction: AnimatedCardDirection.top,
                  child: Container(
                    color: AppColors.primary,
                    height: 40,
                    width: double.maxFinite,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ValueListenableBuilder<List<BoletoModel>>(
                    valueListenable: controller.boletosNotifier,
                    builder: (_, boletos, __) => AnimatedCard(
                        direction: AnimatedCardDirection.left,
                        child: BoletoInfoWidget(size: boletos.length)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
              child: AnimatedCard(
                direction: AnimatedCardDirection.left,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Meus boletos",
                      style: TextStyles.titleBoldHeading,
                    ),
                    ValueListenableBuilder<int>(
                      valueListenable: controller.notPaidNotifier,
                      builder: (_, v, __) => Text(
                        "${controller.notPaid} ao total para pagar",
                        style: TextStyles.captionBody,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Divider(
                thickness: 1,
                height: 1,
                color: AppColors.stroke,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: controller.boletosNotifier,
              builder: (_, ___, __) {
                if (controller.notPaid == 0) {
                  return EmptyList();
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: BoletoListWidget(
                    controller: controller,
                    paid: false,
                    ss: sS,
                  ),
                );
              },
            )
          ],
        ),
      ],
    );
  }

  void sS() {
    setState(() {});
  }
}
