import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:voyease_frontend/screens/auth/auth_navigation_screen.dart';
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
          path: "/",
          page: AuthNavigationRoute.page,
          initial: true,
          children: [
            AutoRoute(
              path: SelectLanguageRoute.name,
              page: SelectLanguageRoute.page,
              initial: true,
            ),
            AutoRoute(path: LandingRoute.name, page: LandingRoute.page),
            AutoRoute(path: LoginRoute.name, page: LoginRoute.page),
            AutoRoute(path: SignupRoute.name, page: SignupRoute.page),
            AutoRoute(
                path: SignUpVerifyRoute.name, page: SignUpVerifyRoute.page),
            AutoRoute(path: ForgotPswdRoute.name, page: ForgotPswdRoute.page),
            AutoRoute(path: EnterOtpRoute.name, page: EnterOtpRoute.page),
            AutoRoute(
                path: PasswordResetRoute.name, page: PasswordResetRoute.page),
            AutoRoute(path: ResetDoneRoute.name, page: ResetDoneRoute.page),
          ],
        ),
        AutoRoute(
          page: MainRoute.page,
          path: "/home",
          children: [
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
            AutoRoute(
                path: HomeRoute.name, page: HomeRoute.page, children: const []),
          ],
        )
      ];
}
