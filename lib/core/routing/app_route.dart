// ignore_for_file: prefer_const_constructors

import 'package:go_router/go_router.dart';
import 'package:travel_app/presentation/pages/forget.dart';
import 'package:travel_app/presentation/pages/forget2.dart';
import 'package:travel_app/presentation/pages/forget3.dart';
import 'package:travel_app/presentation/pages/forget4.dart';
import 'package:travel_app/presentation/pages/forget5.dart';
import 'package:travel_app/presentation/pages/otpScreen.dart';
import 'package:travel_app/presentation/pages/forget7.dart';
import 'package:travel_app/presentation/pages/home.dart';
import 'package:travel_app/presentation/pages/intro.dart';
import 'package:travel_app/presentation/pages/login.dart';
import 'package:travel_app/presentation/pages/regis.dart';
import 'package:travel_app/presentation/pages/splash_screen.dart';

part 'route_name.dart';

final appRoute = GoRouter(routes: [
  GoRoute(
    path: '/home',
    name: Routes.home,
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/',
    name: Routes.splash,
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    path: '/intro',
    name: Routes.intro,
    builder: (context, state) => ScreenIntroduction(),
  ),
  GoRoute(
    path: '/login',
    name: Routes.login,
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    path: '/register',
    name: Routes.register,
    builder: (context, state) => RegisterScreen(),
  ),
  GoRoute(
    path: '/forget',
    name: Routes.forget,
    builder: (context, state) => ForgetPasswordScreen(),
  ),
  GoRoute(
    path: '/forget2',
    name: Routes.forget2,
    builder: (context, state) => CreateNewPasswordScreen(),
  ),
  GoRoute(
    path: '/forget3',
    name: Routes.forget3,
    builder: (context, state) => PasswordScreen(),
  ),
  GoRoute(
    path: '/forget4',
    name: Routes.forget4,
    builder: (context, state) => LupaPasswordEmail(),
  ),
  GoRoute(
    path: '/forget5',
    name: Routes.forget5,
    builder: (context, state) => CreateEmailScreen(),
  ),
  GoRoute(
      path: '/otp_verification',
      name: Routes.otp_verification,
      builder: (context, state) {
        final email = state.extra as String;
        return OTPVerificationScreen(email: email,);
      }),
  GoRoute(
    path: '/forget7',
    name: Routes.forget7,
    builder: (context, state) => SuccessScreen(),
  )
]);
