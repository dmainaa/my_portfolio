import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_portifolio/translations/locale_keys.g.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.portfolio.tr()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'projects_description'.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to another screen or perform an action
              },
              child: Text('Go to Next Screen'),
            ),
          ],
        ),
      ),
    );
  }
}