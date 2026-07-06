// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:js' as js;

Future<String> executeRecaptchaV3(
  String siteKey,
  String actionName,
) async {
  final completer = Completer<String>();
  try {
    final grecaptcha = js.context['grecaptcha'];

    if (grecaptcha == null) {
      return '';
    }

    grecaptcha.callMethod('ready', [
      js.allowInterop(() {
        try {
          final promise = grecaptcha.callMethod('execute', [
            siteKey,
            js.JsObject.jsify({'action': actionName}),
          ]);

          promise.callMethod('then', [
            js.allowInterop((token) {
              if (!completer.isCompleted) {
                completer.complete(token?.toString() ?? '');
              }
            }),
          ]);

          promise.callMethod('catch', [
            js.allowInterop((error) {
              if (!completer.isCompleted) {
                completer.complete('');
              }
            }),
          ]);
        } catch (e) {
          if (!completer.isCompleted) {
            completer.complete('');
          }
        }
      }),
    ]);

    return completer.future.timeout(
      const Duration(seconds: 8),
      onTimeout: () => '',
    );
  } catch (e) {
    return '';
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
