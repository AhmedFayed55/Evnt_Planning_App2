import 'package:evnt_planning_app/providers/app_language_provider.dart';
import 'package:evnt_planning_app/providers/app_theme_provider.dart';
import 'package:evnt_planning_app/ui/auth/login/login_screen.dart';
import 'package:evnt_planning_app/ui/auth/register/register_screen.dart';
import 'package:evnt_planning_app/ui/home/tabs/home_tab/add_event/add_event.dart';
import 'package:evnt_planning_app/ui/home/tabs/main_screen/main_screen.dart';
import 'package:evnt_planning_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AppLanguageProvider(),
    ),
    ChangeNotifierProvider(create: (context) => AppThemeProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: MainScreen.routeName,
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        AddEvent.routeName: (context) => AddEvent()
      },
      locale: Locale(languageProvider.appLanguage),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appThemeMode,
    );
  }
}
