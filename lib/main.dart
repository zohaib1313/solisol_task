import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solisoltask/screens/splash_screen.dart';
import 'package:solisoltask/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: RoutesAndNavigation.multiProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: RoutesAndNavigation.routes,
        navigatorKey: navigatorKey,
        theme: ThemeData(textTheme: GoogleFonts.ibmPlexSansTextTheme()),
      ),
    );
  }
}
