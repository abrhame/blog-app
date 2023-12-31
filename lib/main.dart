import 'package:blog_application/features/blog/presentation/blocs/auth/auth_bloc.dart';
import 'package:blog_application/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import "./Route.dart" as route;
import "core/routes/blog_app_routes.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(BlocProvider(
    create: (context) => sl<AuthBloc>(),
    child: MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: GoogleFonts.poppins().fontFamily,
          colorScheme:
              ColorScheme.fromSeed(seedColor: const Color(0xFF376AED))),
      darkTheme: ThemeData(
          useMaterial3: true,
          fontFamily: GoogleFonts.poppins().fontFamily,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF376AED), brightness: Brightness.dark)),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.controller,
      themeMode: ThemeMode.system,
      initialRoute: BlogAppRoutes.SPLASH,
    ),
  ));
}
