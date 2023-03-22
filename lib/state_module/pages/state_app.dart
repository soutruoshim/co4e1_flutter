import 'package:c4e1/state_module/pages/theme_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logics/language_logic.dart';
import '../logics/size_logic.dart';
import '../logics/theme_logic.dart';

class StateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SizeLogic()),
        ChangeNotifierProvider(create: (context) => ThemeLogic()),
        ChangeNotifierProvider(create: (context) => LanguageLogic()),
      ],
      child: ThemePage(),
    );
  }
}
