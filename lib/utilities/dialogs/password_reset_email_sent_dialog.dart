import 'package:flutter/material.dart';
import 'package:mdapp/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSendDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Password Reset',
    content:
        'We have now send you a password reset link . Please check your email for more information',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
