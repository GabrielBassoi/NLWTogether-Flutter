import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:nlw_together/modules/extract/extract_page.dart';
import 'package:nlw_together/modules/home/home_controller.dart';
import 'package:nlw_together/modules/login/login_controller.dart';
import 'package:nlw_together/modules/meus_boletos/meus_boletos_page.dart';
import 'package:nlw_together/shared/models/user_model.dart';
import 'package:nlw_together/shared/themes/app_colors.dart';
import 'package:nlw_together/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  final LoginController controller;
  HomePage({
    Key? key,
    required this.user,
    required this.controller,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.bottomCenter,
              radius: 0.7,
              focalRadius: 0.8,
              colors: [
                Color(0xFFFFC480),
                AppColors.primary,
              ],
            ),
          ),
          child: Center(
            child: AnimatedCard(
              direction: AnimatedCardDirection.top,
              child: ListTile(
                title: Text.rich(
                  TextSpan(
                      text: "Ola, ",
                      style: TextStyles.titleRegular,
                      children: [
                        TextSpan(
                          text: widget.user.name,
                          style: TextStyles.titleBoldBackground,
                        )
                      ]),
                ),
                subtitle: Text(
                  "Mantenha suas contas em dia",
                  style: TextStyles.captionShape,
                ),
                trailing: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  height: 48,
                  width: expanded ? 96 : 48,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      expanded
                          ? Expanded(
                              child: IconButton(
                                icon: Icon(
                                  Icons.exit_to_app,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  widget.controller.googleLogOut(context);
                                },
                              ),
                            )
                          : Container(),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              expanded = !expanded;
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              widget.user.photoURL!,
                              alignment: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: [
        MeusBoletosPage(
          key: UniqueKey(),
        ),
        ExtractPage(
          key: UniqueKey(),
        ),
      ][controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedCard(
              direction: AnimatedCardDirection.left,
              child: IconButton(
                onPressed: () {
                  controller.setPage(0);
                  setState(() {});
                },
                icon: Icon(
                  Icons.home,
                  color: controller.currentPage == 0
                      ? AppColors.primary
                      : AppColors.body,
                ),
              ),
            ),
            AnimatedCard(
              direction: AnimatedCardDirection.bottom,
              child: InkWell(
                onTap: () async {
                  await Navigator.pushNamed(context, "/barcode_scanner");
                  setState(() {});
                },
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  ),
                ),
              ),
            ),
            AnimatedCard(
              direction: AnimatedCardDirection.right,
              child: IconButton(
                onPressed: () {
                  controller.setPage(1);
                  setState(() {});
                },
                icon: Icon(
                  Icons.description_outlined,
                  color: controller.currentPage == 1
                      ? AppColors.primary
                      : AppColors.body,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
