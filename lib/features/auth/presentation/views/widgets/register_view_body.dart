import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/errors/util/app_router.dart';
import 'package:news_app/core/errors/widgets/custom_button.dart';
import 'package:news_app/core/errors/widgets/custom_text_field.dart';
import 'package:news_app/core/errors/widgets/show_snack_bar.dart';
import 'package:news_app/features/auth/presentation/views/manager/register_cubit/register_cubit.dart';
import 'package:news_app/features/auth/presentation/views/manager/register_cubit/register_state.dart';

class RegisterViewBody extends StatelessWidget {     
  RegisterViewBody({super.key});
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          isLoading = true;
        } else if (state is RegisterSuccessState) {
          isLoading = false;
          context.go(AppRouter.loginView);
          
        } else if (state is RegisterFailedState) {
          
          showSnackBar(context, state.erroMessage);
          isLoading = false;
          
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: const Color(0xff2B475E),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  const Row(
                    children: [
                      Text(
                        'REGISTER',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormTextField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    obscureText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      backgroundColor: AppColors.buttonColor,
                      text: 'Register',
                      textColor: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      onPressed: () async { 
                        if (formKey.currentState!.validate()) {
                          await BlocProvider.of<RegisterCubit>(context)
                              .registerUser(email: email!, password: password!);
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'already have an account?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(  
                        onTap: () {  
                          context.go(AppRouter.loginView);
                        },
                        child: const Text(
                          '  Login',
                          style: TextStyle(
                            color: Color(0xffC7EDE6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
