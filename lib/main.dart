import 'package:calculator/app/app.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  const size = Size(275, 490);
  const options = WindowOptions(
    size: size,
    minimumSize: size,
    maximumSize: size,
  );

  windowManager.waitUntilReadyToShow(options, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: "Calculadora",
      color: Colors.transparent,
      debugShowCheckedModeBanner: false,
      builder: (context, _) => const App(),
    );
  }
}
