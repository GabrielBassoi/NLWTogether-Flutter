import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nlw_together/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:nlw_together/modules/splash/splash_page.dart';
import 'package:nlw_together/shared/models/user_model.dart';

import 'modules/home/home_page.dart';
import 'modules/insert_boleto/inser_boleto_page.dart';
import 'modules/login/login_controller.dart';
import 'modules/login/login_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(user: ModalRoute.of(context)!.settings.arguments as UserModel, controller: controller,),
        "/login": (context) => LoginPage(controller: controller,),
        "/barcode_scanner": (context) => BarcodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage(barcode: ModalRoute.of(context)!.settings.arguments != null ? ModalRoute.of(context)!.settings.arguments.toString() : null,),
      },
    );
  }
}
