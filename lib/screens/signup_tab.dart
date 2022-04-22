import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solisoltask/utils/routes.dart';
import 'package:solisoltask/view_models/sign_up_view_model.dart';

import '../utils/styles.dart';
import '../utils/up_path_clip.dart';
import '../utils/widgets.dart';

class SignUpTab extends StatelessWidget {
  final Function onPressed;

  SignUpTab({required this.onPressed});

  var viewModel = Provider.of<SignUpViewModel>(myContext!);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 0.0,
          left: size.width * 0.05,
          right: size.width * 0.05,
          bottom: size.width * 0.0),
      child: Stack(
        children: <Widget>[
          UpPathClip(
            child: Stack(
              children: <Widget>[
                Material(
                  elevation: 16,
                  child: Container(
                      height: double.infinity,
                      color: Colors.white,
                      child: _buildForm(size, textTheme)),
                ),
              ],
            ),
          ),
          Positioned(
            top: 24,
            left: 12,
            child: InkWell(
              onTap: () => onPressed(),
              child: const Material(
                  elevation: 0.0,
                  shape: CircleBorder(),
                  color: Colors.pinkAccent,
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForm(Size size, TextTheme textTheme) {
    return Padding(
        padding: EdgeInsets.only(top: size.height * 0.15, left: 24, right: 24),
        child: SingleChildScrollView(
          child: Form(
            key: viewModel.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Text(
                    "Logo",
                    style: AppTextStyles.textStyleNormalLargeTitle
                        .copyWith(fontSize: 50),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                MyTextField(
                  hintText: "User Name",
                  controller: viewModel.userNameController,
                  suffixIconWidet: const Icon(Icons.person),
                  validator: (string) {
                    if ((string ?? '').isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                MyTextField(
                  hintText: "Email",
                  controller: viewModel.emailController,
                  suffixIconWidet: const Icon(Icons.mail),
                  validator: (string) {
                    if ((string ?? '').isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                MyTextField(
                  hintText: "Password",
                  controller: viewModel.passwordController,
                  suffixIconWidet: const Icon(Icons.key),
                  validator: (string) {
                    if ((string ?? '').isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                MyTextField(
                  hintText: "Confirm Password",
                  controller: viewModel.confirmPasswordController,
                  suffixIconWidet: const Icon(Icons.key),
                  validator: (string) {
                    if ((string ?? '').isEmpty) {
                      return "Required";
                    } else if ((string ?? "") !=
                        viewModel.passwordController.text) {
                      return "Password does not match";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 48,
                ),
                Align(
                  alignment: FractionalOffset.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.2),
                    child: SizedBox(
                      width: 400,
                      child: RoundedButton(
                        text: "Sign up",
                        textColor: AppColor.whiteColor,
                        onPressed: () {
                          if (viewModel.formKey.currentState!.validate()) {
                            viewModel.signUp(myContext!);
                          }
                        },
                        linearGradient: const LinearGradient(
                          begin: FractionalOffset.bottomLeft,
                          end: FractionalOffset.topRight,
                          colors: <Color>[
                            AppColor.primaryone,
                            AppColor.primarydark
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
