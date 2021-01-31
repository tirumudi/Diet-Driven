import 'package:dietdriven/domain/user_account.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  final UserAccount user; // TODO: nullable
  final List<DeepLink> deepLinkHistory;

  NavigationState({this.user, this.deepLinkHistory});

  NavigationState.splash() : user = null, deepLinkHistory = [
    DeepLink(currentPage: DeepLinkPage.splash, splashDeepLink: SplashDeepLink())
  ];

  NavigationState.unauthenticated() : user = null, deepLinkHistory = [
    DeepLink(currentPage: DeepLinkPage.landing, landingDeepLink: LandingDeepLink())
  ];

  DeepLink get currentDeepLink {
    assert(deepLinkHistory.isNotEmpty);
    return deepLinkHistory.last;
  }

  NavigationState copyWith({
    UserAccount user,
    String error,
    List<DeepLink> deepLinkHistory,
  }) => NavigationState(
    user: user ?? this.user,
    deepLinkHistory: deepLinkHistory ?? this.deepLinkHistory,
  );

  @override
  List<Object> get props => [user, deepLinkHistory];

  @override
  bool get stringify => true;
}