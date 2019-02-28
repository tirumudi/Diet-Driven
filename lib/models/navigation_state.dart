library navigation_state;

import 'package:built_value/built_value.dart';
import 'package:diet_driven/data/page.dart';

part 'navigation_state.g.dart';

///
abstract class NavigationState implements Built<NavigationState, NavigationStateBuilder> {
  Page get activePage;
  Page get defaultPage;

  List<Page> get bottomNavigation;

  @nullable // due to goTo being called form initApp
  Page get bottomNavigationPage;

  NavigationState._();
  factory NavigationState([updates(NavigationStateBuilder b)]) = _$NavigationState;
}

abstract class NavigationStateBuilder implements Builder<NavigationState, NavigationStateBuilder> {
  Page activePage = Page.diary;
  Page defaultPage = Page.diary;

  List<Page> bottomNavigation = [Page.diary, Page.track, Page.diet, Page.goals, Page.settings];

  @nullable
  Page bottomNavigationPage;

  factory NavigationStateBuilder() = _$NavigationStateBuilder;
  NavigationStateBuilder._();
}