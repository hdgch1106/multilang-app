import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multilang_app/infrastructure/utils/language.dart';
import 'package:multilang_app/presentation/blocs/locale_bloc/locale_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multilang App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<LocaleBloc, LocaleState>(
              builder: (context, state) {
                return _buildLanguageSwitch(
                  context,
                  Theme.of(context),
                  state,
                );
              },
            ),
            Text(
              l10n.testMedium,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSwitch(
    BuildContext context,
    ThemeData theme,
    LocaleState state,
  ) {
    return TextButton(
      onPressed: () {
        context.read<LocaleBloc>().add(
              ChangeLanguage(
                state.selectedLanguage == Language.english
                    ? Language.spanish
                    : Language.english,
              ),
            );
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "EN",
            style: TextStyle(
              fontSize: 18,
              color: state.selectedLanguage == Language.english
                  ? Colors.blue
                  : Colors.black,
            ),
          ),
          const TextSpan(
            text: " | ",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: "ES",
            style: TextStyle(
              fontSize: 18,
              color: state.selectedLanguage == Language.spanish
                  ? Colors.blue
                  : Colors.black,
            ),
          ),
        ]),
      ),
    );
  }
}
