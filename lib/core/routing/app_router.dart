import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:voyease_frontend/screens/settings/about_us_screen.dart';
import 'package:voyease_frontend/screens/auth/enter_otp_screen.dart';
import 'package:voyease_frontend/screens/settings/feedback_form_screen.dart';
import 'package:voyease_frontend/screens/home_page.dart';
import 'package:voyease_frontend/screens/main_screen.dart';
import 'package:voyease_frontend/screens/auth/password_reset_screen.dart';
import 'package:voyease_frontend/screens/settings/previous_bookings_screen.dart';
import 'package:voyease_frontend/screens/settings/raise_issue_screen.dart';
import 'package:voyease_frontend/screens/auth/reset_done_screen.dart';
import 'package:voyease_frontend/screens/auth/forgot_pswd_screen.dart';
import 'package:voyease_frontend/screens/auth/landing_screen.dart';
import 'package:voyease_frontend/screens/auth/login_screen.dart';
import 'package:voyease_frontend/screens/auth/select_language_screen.dart';
import 'package:voyease_frontend/screens/settings/settings_navigation_screen.dart';
import 'package:voyease_frontend/screens/settings/settings_screen.dart';
import 'package:voyease_frontend/screens/auth/sign_up_verify_screen.dart';
import 'package:voyease_frontend/screens/auth/signup_screen.dart';
import 'package:voyease_frontend/screens/settings/user_profile_screen.dart';

part 'app_router.gr.dart';

@Singleton()
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          path: "/",
          initial: true,
          children: [
            // AutoRoute(
            //   path: "select-language",
            //   page: SelectLanguageRoute.page,
            //   // initial: true,
            // ),
            // AutoRoute(path: "landing", page: LandingRoute.page),
            // AutoRoute(path: "login", page: LoginRoute.page),
            // AutoRoute(path: "signup", page: SignupRoute.page),
            // AutoRoute(path: "signup-verify", page: SignUpVerifyRoute.page),
            // AutoRoute(path: "forgot-pswd", page: ForgotPswdRoute.page),
            // AutoRoute(path: "enter-otp", page: EnterOtpRoute.page),
            // AutoRoute(path: "password-reset", page: PasswordResetRoute.page),
            // AutoRoute(path: "reset-done", page: ResetDoneRoute.page),
            // AutoRoute(path: "main", page: MainRoute.page),
            AutoRoute(
                path: SettingsNavigationRoute.name,
                page: SettingsNavigationRoute.page,
                children: [
                  AutoRoute(
                      path: SettingsRoute.name,
                      page: SettingsRoute.page,
                      initial: true),
                  AutoRoute(
                      path: UserProfileRoute.name, page: UserProfileRoute.page),
                  AutoRoute(
                      path: PreviousBookingsRoute.name,
                      page: PreviousBookingsRoute.page),
                  AutoRoute(
                      path: RaiseIssueRoute.name, page: RaiseIssueRoute.page),
                  AutoRoute(
                      path: FeedbackFormRoute.name,
                      page: FeedbackFormRoute.page),
                  AutoRoute(path: AboutUsRoute.name, page: AboutUsRoute.page),
                ]),
            AutoRoute(path: "home", page: HomeRoute.page, children: const []),
          ],
          // initial: true,
        )
      ];
}
