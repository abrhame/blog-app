import 'package:blog_application/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:blog_application/features/blog/presentation/pages/articles_reading_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import "./Route.dart" as route;
import "core/routes/blog_app_routes.dart";
import "./features/blog/domain/usecases/isloged_in_usecase.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  IsLogedIn ins = sl<IsLogedIn>();
  bool islogedin = await ins.call();
  runApp(MaterialApp(
    theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF376AED))),
    debugShowCheckedModeBanner: false,
    onGenerateRoute: route.controller,
    initialRoute: BlogAppRoutes.SPLASH,
  ));
}
