import 'package:bookia/feature/auth/presntaion/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presntaion/forgetpassword/page/forget_screen.dart';
import 'package:bookia/feature/auth/presntaion/login/page/login_screen.dart';
import 'package:bookia/feature/auth/presntaion/new%20password/page/newpassword_screen.dart';
import 'package:bookia/feature/auth/presntaion/otp/page/otp_screen.dart';
import 'package:bookia/feature/auth/presntaion/password%20change/page/passwordchange_screen.dart';
import 'package:bookia/feature/auth/presntaion/register/page/register_screen.dart';
import 'package:bookia/feature/home/data/model/best_seller_response/product.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/pages/detalis_screen.dart';
import 'package:bookia/feature/main/main_app_screen.dart';
import 'package:bookia/feature/splash/splash_screen.dart';
import 'package:bookia/feature/welcome/welcome_csreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splashScreen = "/";
  static const String welcome = "/welcome";
  static const String login = "/login";
  static const String register = "/register";
  static const String forget = "/forget";
  static const String otp = "/otp";
  static const String newpassword = "/newpassword";
  static const String passwordchange = "/passwordchange";
  static const String main = "/main";
  static const String details = '/details';

  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: welcome,
        builder: (context, state) => const WelcomeCsreen(),
      ),

      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginScreen(),
        ),
      ),

      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const RegisterScreen(),
        ),
      ),

      GoRoute(
        path: forget,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const ForgetScreen(),
        ),
      ),

      GoRoute(path: otp, builder: (context, state) => const OtpScreen()),

      GoRoute(
        path: newpassword,
        builder: (context, state) => const NewpasswordScreen(),
      ),

      GoRoute(
        path: passwordchange,
        builder: (context, state) => const PasswordchangeScreen(),
      ),
      GoRoute(path: main, builder: (context, state) => const MainAppScreen()),

      GoRoute(
        path: details,
        builder: (context, state) {
          var book = state.extra as Product;
          return BlocProvider(
            create: (context) => HomeCubit(),
            child: DetailsScreen(book: book),
          );
        },
      ),
    ],
  );
}
