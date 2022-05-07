import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geniopay/core/navigators/navigators.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      onGenerateRoute: generateRoute,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
      ],
      initialRoute: Routes.dashboardScreen,
    );
  }
}
