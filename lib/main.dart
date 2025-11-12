import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_portifolio/presentation/home/home_page.dart';
import 'package:my_portifolio/presentation/project_detail/project_detail_page.dart';
import 'package:portfolio_components/portfolio_components.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US')],
      path: 'assets/translations',
      startLocale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Portfolio',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      theme: PFAppTheme.light,
      home: const HomeScreen(),
      onGenerateRoute: (settings) {
        // Handle /project/:id route
        if (settings.name?.startsWith('/project/') ?? false) {
          final args = settings.arguments as Map<String, dynamic>?;
          if (args != null && args['project'] != null) {
            return MaterialPageRoute(
              builder: (context) => ProjectDetailPage(
                project: args['project'] as PFProject,
              ),
              settings: settings,
            );
          }
        }
        return null;
      },
    );
  }
}

