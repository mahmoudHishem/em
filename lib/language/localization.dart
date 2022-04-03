import 'package:get/get.dart';

import '../utilis/my_string.dart';
import 'ar.dart';
import 'en.dart';
import 'fr.dart';

class LocalizationApp extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    ene: en,
    ara : ar,
    frf: fr,
  };



}