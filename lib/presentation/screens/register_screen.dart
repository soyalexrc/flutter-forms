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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombre de usuario',
              onChanged: (value) {
                username = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty ) return 'Campo requerido';
                if (value.length < 6) return 'Mas de 6 digitos';
                return null;
              },
            ),

            const SizedBox(height: 10),

            CustomTextFormField(
              label: 'Correo electronico',
              onChanged: (value) {
                email = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty ) return 'Campo requerido';
                final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',);
                if (!emailRegExp.hasMatch(value)) return 'No tiene formato de correo';
                return null;
              },
            ),

            const SizedBox(height: 20),

            CustomTextFormField(
              label: 'Contrasena',
              onChanged: (value) {
                password = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty ) return 'Campo requerido';
                if (value.length < 6) return 'Mas de 6 digitos';
                return null;
              },
              obscureText: true,
            ),

            const SizedBox(height: 20),

            FilledButton.tonalIcon(
                onPressed: () {

                  final bool isValid = _formKey.currentState!.validate();

                  if (!isValid) return;
                  print('$username, $email, $password');
                },
                icon: Icon(Icons.save),
                label: const Text('Crear usuario')),
            const SizedBox(height: 20),
          ],
        )
    );
  }
}
