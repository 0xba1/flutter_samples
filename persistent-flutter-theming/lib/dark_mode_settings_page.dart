import 'package:example/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkThemeSettingsPage extends StatefulWidget {
  const DarkThemeSettingsPage({Key? key}) : super(key: key);

  @override
  _DarkThemeSettingsPageState createState() => _DarkThemeSettingsPageState();
}

class _DarkThemeSettingsPageState extends State<DarkThemeSettingsPage> {
  late int _groupValue;

  @override
  void initState() {
    switch (Provider.of<ThemeModeProvider>(context, listen: false).themeMode) {
      case ThemeMode.system:
        _groupValue = 0;
        break;
      case ThemeMode.dark:
        _groupValue = 1;
        break;
      case ThemeMode.light:
        _groupValue = 2;
        break;
    }
    super.initState();
  }

  Future<void> _handleRadioValueChange(newVal) async {
    setState(() {
      _groupValue = newVal;
    });

    ThemeModeProvider themeModeProvider =
        Provider.of<ThemeModeProvider>(context, listen: false);
    switch (newVal) {
      case 1:
        await themeModeProvider.darkModeOn();
        break;
      case 2:
        await themeModeProvider.darkModeOff();
        break;
      default:
        await themeModeProvider.useSystemSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Mode Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () async => await _handleRadioValueChange(0),
            title: const Text('Use System Settings'),
            trailing: Radio(
              value: 0,
              groupValue: _groupValue,
              onChanged: (newVal) async =>
                  await _handleRadioValueChange(newVal),
            ),
          ),
          ListTile(
            onTap: () async => await _handleRadioValueChange(1),
            title: const Text('On'),
            trailing: Radio(
              value: 1,
              groupValue: _groupValue,
              onChanged: (newVal) async =>
                  await _handleRadioValueChange(newVal),
            ),
          ),
          ListTile(
            onTap: () async => await _handleRadioValueChange(2),
            title: const Text('Off'),
            trailing: Radio(
              value: 2,
              groupValue: _groupValue,
              onChanged: (newVal) async =>
                  await _handleRadioValueChange(newVal),
            ),
          )
        ],
      ),
    );
  }
}
