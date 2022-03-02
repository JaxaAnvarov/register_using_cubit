import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_using_cubit/screens/auth/auth_cubit.dart';

class AuthBlocView extends StatelessWidget {
  AuthBlocView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    next() {
      return Navigator.pushNamed(context, '/home');
    }

    return BlocProvider(
      create: (context) =>
          AuthCubit(_formKey, _emailController, _passwordController),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthInitial) {
            return buildScaffold(context, state);
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Home Page',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
              ),
            );
          }
        },
      ),
    );
  }

  buildScaffold(BuildContext context, AuthState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    label: const Text('Email'),
                  ),
                  validator: (v) => v!.isEmpty ? 'REQUIRED EMAIL' : null,
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    label: const Text('Password'),
                  ),
                  validator: (v) => v!.isEmpty ? 'REQUIRED PASSWORD' : null,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            child: const Text(
              'Sing In',
            ),
            onPressed: () {
              context.read<AuthCubit>().usersLogin();
            },
          ),
        ],
      ),
    );
  }
}
