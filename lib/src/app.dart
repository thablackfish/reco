import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:reco/src/reco/cart.dart';
import 'package:reco/src/reco/pd.dart';
import 'package:reco/src/reco/profile.dart';
import 'package:reco/src/reco/upload.dart';
import 'reco/reco.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';


/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          debugShowCheckedModeBanner: false,

          // Define a function to handle named routes
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case ECommerceLandingPage.routeName:
                    return const ECommerceLandingPage();
                  case '/productdetail': // Add the new route here
                    return const ProductDetailPage();
                  case '/cart': // Add the new route here
                    return const CartPage();
                  case '/upload': // Add the new route here
                    return const UploadPage();
                  case '/profile': // Add the new route here
                    return ProfilePage();
                    
                  default:
                    return const ECommerceLandingPage(); // Fallback to the landing page
                }
              },
            );
          },
        );
      },
    );
  }
}