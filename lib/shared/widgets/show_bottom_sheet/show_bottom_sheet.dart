import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nlw_together/shared/models/boleto_model.dart';
import 'package:nlw_together/shared/themes/app_colors.dart';
import 'package:nlw_together/shared/themes/app_text_styles.dart';

void showBottomSheetWidget(BuildContext context, BoletoModel data, String text,
    VoidCallback one, VoidCallback two, Function ss) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      final size = MediaQuery.of(context).size;
      return Container(
        height: 330,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 2,
                  width: size.width * 0.12,
                  color: AppColors.input,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 78, right: 78, top: 24),
                  child: Text.rich(
                      TextSpan(
                        text: "O boleto ",
                        style: TextStyles.titleRegularBody,
                        children: [
                          TextSpan(
                            text: data.name,
                            style: TextStyles.titleBoldHeading,
                          ),
                          TextSpan(
                            text: ' no valor de R\$',
                            style: TextStyles.titleRegularBody,
                          ),
                          TextSpan(
                            text: "${data.value!.toStringAsFixed(2)}",
                            style: TextStyles.titleBoldHeading,
                          ),
                          TextSpan(
                            text: '$text pago?',
                            style: TextStyles.titleRegularBody,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 19),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: AppColors.stroke),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Ainda não",
                          style: TextStyles.buttonHeading,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      one();
                      ss();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 19),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Sim",
                          style: TextStyles.buttonBackground,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Divider(
                color: AppColors.stroke,
                thickness: 1,
              ),
            ),
            SizedBox(height: 13),
            InkWell(
              onTap: () {
                two();
                ss();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.trashAlt,
                    color: AppColors.delete,
                    size: 20,
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Text(
                    "Deletar boleto",
                    style: TextStyles.buttonDelete,
                  ),
                ],
              ),
            ),
            SizedBox(height: 17),
          ],
        ),
      );
    },
  );
}
