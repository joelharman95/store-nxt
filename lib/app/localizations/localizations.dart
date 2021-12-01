import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:store_nxt/app/localizations/intl/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get settings =>
      Intl.message('Settings', name: 'settings', desc: 'Settings');

  String get error {
    return Intl.message('Error', name: 'error', desc: "Error label");
  }

  String get success {
    return Intl.message('Success', name: 'success', desc: "Success label");
  }

  String get info {
    return Intl.message('Information', name: 'info', desc: "Info label");
  }

  String get ok {
    return Intl.message('Okay', name: 'Okay', desc: "Ok label");
  }

  String get warning {
    return Intl.message('Attention', name: 'warning', desc: "Warning label");
  }

  String get confirmation {
    return Intl.message('Confirmation',
        name: 'confirmation', desc: "Confirmation label");
  }

  String get cancel {
    return Intl.message('Annuler', name: 'cancel', desc: "Cancel label");
  }

  String get yes {
    return Intl.message('Oui', name: 'yes', desc: "Yes label");
  }

  String get no {
    return Intl.message('Non', name: 'no', desc: "No label");
  }

  String get route {
    return Intl.message('Itinéraire', name: 'route', desc: "route label");
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
