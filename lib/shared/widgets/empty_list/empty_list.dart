import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nlw_together/shared/themes/app_colors.dart';
import 'package:nlw_together/shared/themes/app_text_styles.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 8,
                color: AppColors.input,
              ),
            ),
            child: Icon(
              FontAwesomeIcons.barcode,
              size: 110,
            ),
          ),
          SizedBox(height: 15,),
          Text(
            "Você não tem nenhum boleto!",
            style: TextStyles. titleBoldHeading,
          ),
        ],
      ),
    );
  }
}
