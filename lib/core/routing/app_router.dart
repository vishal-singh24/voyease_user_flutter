import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:voyease_frontend/screens/about_us_screen.dart';
import 'package:voyease_frontend/screens/enter_otp_screen.dart';
import 'package:voyease_frontend/screens/feedback_form_screen.dart';
import 'package:voyease_frontend/screens/main_screen.dart';
import 'package:voyease_frontend/screens/password_reset_screen.dart';
import 'package:voyease_frontend/screens/previous_bookings_screen.dart';
import 'package:voyease_frontend/screens/raise_issue_screen.dart';
import 'package:voyease_frontend/screens/reset_done_screen.dart';
import 'package:voyease_frontend/screens/forgot_pswd_screen.dart';
import 'package:voyease_frontend/screens/landing_screen.dart';
import 'package:voyease_frontend/screens/login_screen.dart';
import 'package:voyease_frontend/screens/select_language_screen.dart';
import 'package:voyease_frontend/screens/sign_up_verify_screen.dart';
import 'package:voyease_frontend/screens/signup_screen.dart';
import 'package:voyease_frontend/screens/user_profile_screen.dart';

part 'app_router.gr.dart';

@Singleton()
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            path: "/select-language",
            page: SelectLanguageRoute.page,
            initial: true),
        AutoRoute(path: "/landing", page: LandingRoute.page),
        AutoRoute(path: "/login", page: LoginRoute.page),
        AutoRoute(path: "/signup", page: SignupRoute.page),
        AutoRoute(path: "/signup-verify", page: SignUpVerifyRoute.page),
        AutoRoute(path: "/forgot-pswd", page: ForgotPswdRoute.page),
        AutoRoute(path: "/enter-otp", page: EnterOtpRoute.page),
        AutoRoute(path: "/password-reset", page: PasswordResetRoute.page),
        AutoRoute(path: "/reset-done", page: ResetDoneRoute.page),
        AutoRoute(path: "/main", page: MainRoute.page),
        AutoRoute(path: "/user-profile", page: UserProfileRoute.page),
        AutoRoute(path: "/previous-bookings", page: PreviousBookingsRoute.page),
        AutoRoute(path: "/raise-issue", page: RaiseIssueRoute.page),
        AutoRoute(path: "/feedback", page: FeedbackFormRoute.page),
        AutoRoute(path: "/about-us", page: AboutUsRoute.page),
      ];
}
