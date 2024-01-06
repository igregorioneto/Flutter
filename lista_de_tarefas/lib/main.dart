import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/apps/app_android.dart' as android;
import 'package:lista_de_tarefas/apps/app_ios.dart' as ios;

void main() {
  if (Platform.isIOS) {
    runApp(ios.MyApp());
  } else {
    //runApp(android.MyApp());
    runApp(ios.MyApp());
  }
}
