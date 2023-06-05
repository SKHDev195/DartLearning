import 'package:advisor/2_application/core/services/theme_service.dart';
import 'package:advisor/2_application/pages/advice/cubit/advisor_cubit.dart';
import 'package:advisor/2_application/pages/advice/widgets/advice_field.dart';
import 'package:advisor/2_application/pages/advice/widgets/custom_advisor_button.dart';
import 'package:advisor/2_application/pages/advice/widgets/error_message.dart';
import 'package:advisor/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AdvicePageWrapperProvider extends StatelessWidget {
  const AdvicePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AdvisorCubit>(),
      child: const AdvisorPage(),
    );
  }
}

class AdvisorPage extends StatelessWidget {
  const AdvisorPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<AdvisorCubit, AdvisorStateCubit>(
                  builder: (context, state) {
                    if (state is AdvisorInitial) {
                      return Text(
                        'Your advice is waiting for you!',
                        style: themeData.textTheme.displayLarge,
                        textAlign: TextAlign.center,
                      );
                    } else if (state is AdvisorStateLoading) {
                      return CircularProgressIndicator(
                        color: themeData.colorScheme.secondary,
                      );
                    } else if (state is AdvisorStateLoaded) {
                      return AdviceField(
                        advice: state.advice,
                      );
                    } else if (state is AdvisorStateError) {
                      return const ErrorMessage(
                        message: 'Something has gone wrong',
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 200,
              child: Center(
                child: CustomAdvisorButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
