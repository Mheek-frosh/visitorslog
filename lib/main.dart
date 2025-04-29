import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'app.dart';
import 'blocs/user_bloc.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => BlocProvider(
        create: (_) => UserBloc(),
        child: MyApp(),
      ),
    ),
  );
}
