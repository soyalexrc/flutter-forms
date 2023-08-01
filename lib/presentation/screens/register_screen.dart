import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/form/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const FlutterLogo(
                size: 200,
              ),
              const _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombre de usuario',
            ),

            const SizedBox(height: 10),

            CustomTextFormField(
              label: 'Correo electronico',
            ),

            const SizedBox(height: 20),

            CustomTextFormField(
              label: 'Contrasena',
              obscureText: true,
            ),

            const SizedBox(height: 20),

            FilledButton.tonalIcon(
                onPressed: () {},
                icon: Icon(Icons.save),
                label: const Text('Crear usuario')),
            const SizedBox(height: 20),
          ],
        )
    );
  }
}
