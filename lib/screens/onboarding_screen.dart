import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solisoltask/screens/signin_tab.dart';
import 'package:solisoltask/screens/signup_tab.dart';
import 'package:solisoltask/utils/routes.dart';

import '../view_models/onboarding_view_model.dart';

class OnBoardingScreen extends StatefulWidget {
  static const id = 'OnBoardingScreen';

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  var viewModel = Provider.of<OnBoardingViewModel>(myContext!, listen: true);
  late PageController _pageController;
  late AnimationController animationController;
  ValueNotifier<double> selectedIndex = ValueNotifier<double>(0.0);

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
    animationController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Stack(
            children: [
              _buildBubbles(
                diameter: size.height,
                top: -size.height * 0.5,
                right: -size.width * 0.1,
                linearGradient: const LinearGradient(
                  begin: FractionalOffset.bottomLeft,
                  end: FractionalOffset.topRight,
                  colors: <Color>[
                    Colors.pink,
                    Colors.orange,
                    Colors.orangeAccent
                  ],
                ),
              ),
              _buildBubbles(
                diameter: size.height,
                top: -size.height * 0.5,
                right: size.width * 0.7,
                linearGradient: const LinearGradient(
                  begin: FractionalOffset.bottomLeft,
                  end: FractionalOffset.topRight,
                  colors: <Color>[
                    Colors.pink,
                    Colors.orange,
                    Colors.orangeAccent
                  ],
                ),
              ),
              _buildBubbles(
                diameter: size.height,
                top: -size.height * 0.5,
                right: size.width * 0.6,
                linearGradient: const LinearGradient(
                  begin: FractionalOffset.bottomLeft,
                  end: FractionalOffset.topRight,
                  colors: <Color>[
                    Colors.pink,
                    Colors.orange,
                    Colors.orangeAccent
                  ],
                ),
              ),
              _buildBubbles(
                diameter: size.height,
                top: -size.height * 0.5,
                right: size.width * 0.5,
                linearGradient: const LinearGradient(
                  begin: FractionalOffset.bottomLeft,
                  end: FractionalOffset.topRight,
                  colors: <Color>[
                    Colors.pink,
                    Colors.orange,
                    Colors.orangeAccent
                  ],
                ),
              ),
              _buildBubbles(
                diameter: size.height,
                top: size.height * 0.7,
                right: -size.width * 1.2,
                linearGradient: const LinearGradient(
                  begin: FractionalOffset.bottomLeft,
                  end: FractionalOffset.topRight,
                  colors: <Color>[
                    Colors.pink,
                    Colors.orange,
                    Colors.orangeAccent
                  ],
                ),
              ),
              _buildBubbles(
                diameter: size.height,
                top: size.height * 0.8,
                right: -size.width * 1.4,
                linearGradient: const LinearGradient(
                  begin: FractionalOffset.bottomLeft,
                  end: FractionalOffset.topRight,
                  colors: <Color>[
                    Colors.pink,
                    Colors.orangeAccent,
                    Colors.deepOrange,
                  ],
                ),
              ),
              FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: animationController,
                    curve: const Interval(
                      0.5,
                      1,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                ),
                child: NotificationListener(
                  onNotification: (ScrollNotification notification) {
                    if (notification.depth == 0 &&
                        notification is ScrollUpdateNotification) {
                      selectedIndex.value = _pageController.page!;
                      setState(() {});
                    }
                    return false;
                  },
                  child: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (int index) {},
                    children: <Widget>[
                      SignInTab(
                        onPressed: () {
                          _pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastOutSlowIn);
                        },
                      ),
                      SignUpTab(onPressed: () {
                        _pageController.animateToPage(0,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.fastOutSlowIn);
                      }),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.75,
                left: size.width * 0.1,
                child: _buildSocialMediaAppButton(
                    0xfff999,
                    -selectedIndex.value,
                    Image.asset('assets/images/twitter.png')),
              ),
              Positioned(
                top: size.height * 0.8,
                left: size.width * 0.3,
                child: _buildSocialMediaAppButton(
                    0xfff654,
                    -selectedIndex.value,
                    Image.asset('assets/images/google.png')),
              ),
              Positioned(
                top: size.height * 0.85,
                left: size.width * 0.5,
                child: _buildSocialMediaAppButton(
                    0xff6546,
                    -selectedIndex.value,
                    Image.asset('assets/images/facebook.png')),
              ),
              Positioned(
                top: size.height * 0.05,
                left: size.width * 0.3,
                child: _buildSocialMediaAppButton(
                    0xfff355,
                    1 - selectedIndex.value,
                    Image.asset('assets/images/twitter.png')),
              ),
              Positioned(
                top: size.height * 0.1,
                left: size.width * 0.5,
                child: _buildSocialMediaAppButton(
                    0xff245,
                    1 - selectedIndex.value,
                    Image.asset('assets/images/google.png')),
              ),
              Positioned(
                top: size.height * 0.15,
                left: size.width * 0.7,
                child: _buildSocialMediaAppButton(
                    0xff6467,
                    1 - selectedIndex.value,
                    Image.asset('assets/images/facebook.png')),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSocialMediaAppButton(
      int color, double animatedValue, Widget childIcon) {
    return FadeTransition(
      opacity: Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: const Interval(
            0.0,
            0.5,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.translationValues(
            animatedValue * MediaQuery.of(context).size.height, 0, 0.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(width: 58, height: 58, child: childIcon)),
      ),
    );
  }

  Widget _buildBubbles(
      {required double diameter,
      required double top,
      required double right,
      required LinearGradient linearGradient}) {
    return Positioned(
      top: top,
      right: right,
      child: Transform(
        transform: Matrix4.diagonal3Values(
            Tween(begin: 0.0, end: 1.0)
                .animate(
                  CurvedAnimation(
                    parent: animationController,
                    curve: const Interval(
                      0.0,
                      0.5,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                )
                .value,
            Tween(begin: 0.0, end: 1.0)
                .animate(
                  CurvedAnimation(
                    parent: animationController,
                    curve: const Interval(
                      0.0,
                      0.5,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                )
                .value,
            0.0),
        child: Container(
          height: diameter,
          width: diameter,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(diameter / 2),
              gradient: linearGradient),
        ),
      ),
    );
  }
}
