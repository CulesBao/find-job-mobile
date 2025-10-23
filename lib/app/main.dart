import 'package:find_job_mobile/app/config/app_widget.dart';
import 'package:find_job_mobile/app/config/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupServiceLocator();

  runApp(const AppWidget());
}
