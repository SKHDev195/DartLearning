import 'package:advisor/2_application/core/services/theme_service.dart';
import 'package:advisor/2_application/pages/advice/widgets/advice_field.dart';
import 'package:advisor/2_application/pages/advice/widgets/custom_advice_button.dart';
import 'package:advisor/2_application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advisor',
          style: themeData.textTheme.displayLarge,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDark,
            onChanged: (_) {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 50,
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ErrorMessage(message: 'Something has gone wrong'),
                /*AdviceField(
                  advice: 'Example advice: some text here',
                ),*/
                /*CircularProgressIndicator(
                  color: themeData.colorScheme.secondary,
                ),*/
                /*Text(
                  'Your advice is waiting for you!',
                  style: themeData.textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),*/
              ),
            ),
            SizedBox(
              height: 200,
              child: Center(
                child: CustomAdviceButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
