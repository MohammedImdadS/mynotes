import 'package:flutter/material.dart';
import 'package:mdapp/constants/routes.dart';
import 'package:mdapp/services/auth/auth_service.dart';
import 'package:mdapp/views/login_view.dart';
import 'package:mdapp/views/notes/create_update_note_view.dart';
import 'package:mdapp/views/notes/notes_view.dart';
import 'package:mdapp/views/register_view.dart';
import 'package:mdapp/views/verify_email_view.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NotesView(),
        verifyEmailRoute:(context) => const VerifyEmailView(),
        createOrUpdateNoteRoute:(context) => const CreateUpdateNoteView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const NotesView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}