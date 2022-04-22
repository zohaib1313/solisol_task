import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solisoltask/utils/routes.dart';
import 'package:solisoltask/utils/styles.dart';
import 'package:solisoltask/utils/widgets.dart';
import 'package:solisoltask/view_models/sign_in_view_model.dart';

import '../utils/down_path_clip.dart';

class SignInTab extends StatelessWidget {
  final Function onPressed;

  SignInTab({Key? key, required this.onPressed}) : super(key: key);
  var viewModel = Provider.of<SignInViewModel>(myContext!);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 0.0,
          left: size.width * 0.05,
          right: size.width * 0.05,
          bottom: size.width * 0.05),
      child: Stack(
        children: <Widget>[
          DownPathClipped(
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
            bottom: 24,
            right: 12,
            child: InkWell(
              onTap: () => onPressed(),
              child: const Material(
                  elevation: 0.0,
                  color: Colors.pinkAccent,
                  shape: CircleBorder(),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.arrow_downward,
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
      padding: EdgeInsets.only(top: size.height * 0.05, left: 24, right: 24),
      child: SingleChildScrollView(
        child: Form(
          key: viewModel.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Center(
                  child: Text(
                    "Logo",
                    style: AppTextStyles.textStyleNormalLargeTitle
                        .copyWith(fontSize: 50),
                  ),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              MyTextField(
                hintText: "Email",
                controller: viewModel.emailController,
                suffixIconWidet: const Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
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
                suffixIconWidet: const Icon(
                  Icons.key,
                  color: Colors.black,
                ),
                validator: (string) {
                  if ((string ?? '').isEmpty) {
                    return "Required";
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
                  child: RoundedButton(
                    text: "Log in",
                    onPressed: () {
                      if (viewModel.formKey.currentState!.validate()) {
                        viewModel.signIn(myContext!);
                      }
                    },
                    textColor: AppColor.whiteColor,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
