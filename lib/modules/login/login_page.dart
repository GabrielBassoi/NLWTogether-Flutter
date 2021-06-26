import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nlw_together/modules/login/login_controller.dart';
import 'package:nlw_together/shared/themes/app_colors.dart';
import 'package:nlw_together/shared/themes/app_images.dart';
import 'package:nlw_together/shared/themes/app_text_styles.dart';
import 'package:nlw_together/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;
  LoginPage({Key? key, required this.controller}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //var googleSignIn = widget.controller.googleSignIn;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: size.width,
            height: size.height * 0.36,
            decoration: BoxDecoration(
              color: AppColors.primary,
              gradient: RadialGradient(
                center: Alignment.bottomCenter,
                colors: [
                  Color(0x00FFC480),
                  AppColors.primary,
                ],
                
              ),
            ),
          ),
          Column(
            children: [
              Flexible(
                child: AnimatedCard(
                  direction: AnimatedCardDirection.top,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          AppImages.person,
                          width: 208,
                          height: 373,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 206,
                          height: 92,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [0.1, 0.5, 0.7, 1],
                              colors: [
                                Color(0xFFFFFFFFF),
                                Color(0x98FFFFFFF),
                                Color(0x44FFFFFFF),
                                Color(0x00FFFFFFF),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        child: Container(
                          margin: EdgeInsets.only(left: 200),
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.grey),
                          child: Center(
                            child: Icon(
                              Icons.description_outlined,
                              color: AppColors.background,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        child: Container(
                          margin: EdgeInsets.only(right: 200, top: 160),
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.grey),
                          child: Center(
                            child: Icon(
                              Icons.add_box_outlined,
                              color: AppColors.background,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.logomini),
                        AnimatedCard(
                          direction: AnimatedCardDirection.right,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 70, right: 70),
                            child: Text(
                              "Organize seus boletos em um só lugar",
                              style: TextStyles.titleHome,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        AnimatedCard(
                          direction: AnimatedCardDirection.left,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 40),
                            child: SocialLoginButton(
                              image: AppImages.google,
                              text: "Entrar com Google",
                              onTap: () {
                                widget.controller.googleSignIn(context);
                              },
                            ),
                          ),
                        ),
                        AnimatedCard(
                          direction: AnimatedCardDirection.right,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 20, bottom: 20),
                            child: SocialLoginButton(
                              icon: FontAwesomeIcons.github,
                              text: "Entrar com GitHub",
                              onTap: () {
                                widget.controller.githubLogin(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
