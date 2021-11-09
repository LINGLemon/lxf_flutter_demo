import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lxf_flutter_demo/pages/blank_page.dart';
import 'package:lxf_flutter_demo/pages/example_list_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/language_bloc.dart';
import 'generated/l10n.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class App extends StatelessWidget {
  /// {@macro app}
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LanguageBloc(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, String>(
      builder: (_, language) {
        return MaterialApp(
          locale: Locale(language),
          supportedLocales: const [
            Locale('en', 'US'), // English
            Locale('zh', 'CH'), // Chinese
          ],
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              currentIndex: 0,
              items: [
                _bottomNavigationBarItem(Icons.list, "样例"),
                _bottomNavigationBarItem(Icons.settings, "设置"),
              ],
            ),
            tabBuilder: (context, index) {
              switch (index) {
                case 0:
                  return const ExampleListPage();
                default:
                  return const BlankPage();
              }
            },
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, String title) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(icon),
      label: title,
    );
  }
}
