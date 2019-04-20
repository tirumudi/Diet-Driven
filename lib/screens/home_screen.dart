import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/screens/diary_page.dart';
import 'package:diet_driven/screens/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diet_driven/blocs/blocs.dart';

class HomePage extends StatefulWidget {
  final DiaryRepository diaryRepository;
  final FoodRepository foodRepository;
  final SettingsRepository settingsRepository;
  final AnalyticsRepository analyticsRepository;

  HomePage({
    @required this.diaryRepository,
    @required this.foodRepository,
    @required this.settingsRepository,
    @required this.analyticsRepository
  }) :
    assert(diaryRepository != null),
    assert(foodRepository != null),
    assert(settingsRepository != null),
    assert(analyticsRepository != null);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NavigationBloc navigationBloc;

  @override
  void initState() {
    super.initState();

    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);
    assert(_userDataBloc.currentState is UserDataLoaded);
    navigationBloc = NavigationBloc(analyticsRepository: widget.analyticsRepository, userDataBloc: _userDataBloc);
  }

  @override
  void dispose() {
    navigationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserDataBloc _userDataBloc = BlocProvider.of<UserDataBloc>(context);

    return BlocProviderTree(
      blocProviders: [
        BlocProvider<NavigationBloc>(bloc: navigationBloc),
      ],
      child: BlocBuilder(
        bloc: navigationBloc,
        builder: (BuildContext context, NavigationState state) {
          return BlocBuilder<UserDataEvent, UserDataState>(
            bloc: _userDataBloc,
            builder: (BuildContext context, UserDataState userDataState) {
              if (state is NavigationUninitialized) {
                return ErrorPage(error: "navigation is uninitialized!");
              }

              assert(state is NavigationLoaded);
              if (state is NavigationLoaded && userDataState is UserDataLoaded) {
                return Scaffold(
                  body: Stack(
                    children: userDataState.userData.settings.navigationSettings.bottomNavigationPages.map((page) =>
                      Offstage(
                        offstage: state.currentPage != page,
                        child: generatePage(page)
                      )
                    ).toList(),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    items: userDataState.userData.settings.navigationSettings.bottomNavigationPages.map((page) =>
                      BottomNavigationBarItem(
                        icon: Icon(Icons.add),
                        title: Text(page),
                      )
                    ).toList(),
                    currentIndex: userDataState.userData.settings.navigationSettings.bottomNavigationPages.indexOf(state.currentPage),
                    onTap: (index) {
                      navigationBloc.dispatch(NavigateToPage((b) => b..page = userDataState.userData.settings.navigationSettings.bottomNavigationPages[index]));
                    },
                  ),
                );
              }
            }
          );
        }
      )
    );
  }

  Widget generatePage(String page) {
    if (page == "diary") {
      // FIXME: diary page wrapper that creates foodDiaryBloc, manages current date, listens to userData bloc for updates!
      return DiaryPage(foodDiaryBloc: FoodDiaryBloc(diaryRepository: widget.diaryRepository, userId: "Z1TAAZu1jDMn0VbSAyKXUO1qc5z2", daysSinceEpoch: 124),);
    }
    if (page == "track") {
      return TestPage(page);
    }
    if (page == "diet") {
      return TestPage(page);
    }
    if (page == "profile") {
      // TODO: checks hasDietDrivenAccess in its bloc (nest subscription bloc)
      // also check autentication bloc to display correct content
      return TestPage(page);
    }
    // TODO: if (page == "recipes")
    return TestPage("FAILURE");
  }
}


class TestPage extends StatelessWidget {
  final String title;
  TestPage(this.title);

  @override
  Widget build(BuildContext context) {
//    final AuthenticationBloc authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('logout'),
            onPressed: () {
//              authenticationBloc.dispatch(SignsOut()); // FIXME: call auth repository's sign out instead!!!
            },
          )
        ),
      ),
    );
  }
}
