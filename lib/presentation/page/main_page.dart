import 'dart:io';
import 'map/map_page.dart';
import '../../res/global.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import '../viewModels/page_view_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../bloc/station_bloc/station_bloc.dart';
import '../../res/generated/locale_keys.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/try_again_button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rentmotors/presentation/page/map/station_info.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:rentmotors/presentation/page/profile/profile_page.dart';
import 'package:rentmotors/presentation/page/map/stations_page.dart';
import 'package:rentmotors/presentation/page/booking/start_booking.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageViewModel pageViewModel = GetIt.instance<PageViewModel>();
  static List<Widget> _widgetOptions = <Widget>[];
  bool? isGooglePlayServicesAvailable;

  @override
  void initState() {
    super.initState();
    if (!Platform.isIOS) {
      checkGooglePlayServicesAvailability();
    }
    context.read<StationBloc>().add(const StationEvent.fetch());
    _widgetOptions = <Widget>[
      const StartBookingPage(),
      StationsPage(
        onPress: () {
          setState(() {
            pageViewModel.selectedIndex = 4;
            pageViewModel.currentTwoIndex = 4;
            pageViewModel.listSelected = true;
          });
        },),
      const ProfilePage(),
      MapScreen(
        onPress: () {
          setState(() {
            pageViewModel.selectedIndex = 1;
            pageViewModel.currentTwoIndex = 1;
          });
        },
        onMarkerPress: () {
          setState(() {
            pageViewModel.selectedIndex = 4;
            pageViewModel.currentTwoIndex = 4;
          });
        },
      ),
      StationInfo(
        onBackPress: () {
          if (pageViewModel.listSelected) {
            setState(() {
              pageViewModel.selectedIndex = 1;
              pageViewModel.currentTwoIndex = 1;
              pageViewModel.listSelected = false;
            });
          } else {
            setState(() {
              pageViewModel.selectedIndex = 3;
              pageViewModel.currentTwoIndex = 3;
            });
          }
        },
        onBookPress: () {
          setState(() {
            pageViewModel.bottomIndex = 0;
            pageViewModel.selectedIndex = 0;
          });
        },
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      if (pageViewModel.bottomIndex != index) {
        if (index == 1) {
          pageViewModel.setIndex(pageViewModel.currentTwoIndex);
        } else {
          pageViewModel.setIndex(index);
        }
      }
    });
  }

  void _navigateToMapScreen() {
    setState(() {
      pageViewModel.currentTwoIndex = 3;
      pageViewModel.setIndex(pageViewModel.currentTwoIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final stateStation = context.watch<StationBloc>().state;
    return stateStation.when(
      loading: () {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Image.asset(
                'assets/pictures/logo.png',
                width: Global.logoWith,
              ),
            ),
          ),
          body: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Global.darkGreen,
            ),
          ),
        );
      },
      loaded: () {
        return Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(pageViewModel.selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Global.getBottomNavBackgroundColor(context),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.search),
                label: LocaleKeys.booking.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.place),
                label: LocaleKeys.stations.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.account_circle_rounded),
                label: LocaleKeys.profile.tr(),
              ),
            ],
            selectedFontSize: 11,
            unselectedFontSize: 11,
            currentIndex: pageViewModel.bottomIndex,
            selectedItemColor: Global.green,
            unselectedItemColor: Global.getIconColor(context),
            onTap: _onItemTapped,
          ),
          floatingActionButton: pageViewModel.selectedIndex == 1
              ? FloatingActionButton(
            backgroundColor: Global.darkGreen,
            onPressed: _navigateToMapScreen,
            child: const Icon(
              Icons.map,
              color: Global.backgroundLightTheme,
            ),
          ) : null,
        );
      },
      error: (String error) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Image.asset(
                'assets/pictures/logo.png',
                width: Global.logoWith,
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.error_label.tr(),
                  style: Global.headerText,
                ),
                const SizedBox(height: 10),
                Text(
                  error,
                  style: Global.errorText,
                ),
                const SizedBox(height: 30),
                TryAgainButtonWidget(
                  text: LocaleKeys.try_again.tr().toLowerCase(),
                  tryAgain: () {
                    context.read<StationBloc>().add(const StationEvent.fetch());
                  },
                ),
              ],
            ),
          ),
        );
      },
      update: () {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Image.asset(
                'assets/pictures/logo.png',
                width: Global.logoWith,
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.please_update.tr(),
                  style: Global.nameCarText,
                ),
                const SizedBox(height: 40),
                TryAgainButtonWidget(
                  text: LocaleKeys.update.tr(),
                  tryAgain: () {
                    if (Platform.isIOS) {
                      openAppStore();
                    } else {
                      if (isGooglePlayServicesAvailable!) {
                        openPlayMarket();
                      } else {
                        openAppGallery();
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void openAppStore() async {
    const String appId = '646358056';
    final url = Uri.parse('itms-apps://apple.com/app/id$appId');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Не удалось открыть App Store';
    }
  }

  void openPlayMarket() async {
    const String appId = 'com.anless.rentmotors';
    final url = Uri.parse('market://details?id=$appId');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Не удалось открыть PlayMarket';
    }
  }

  void openAppGallery() async {
    const String appId = 'C107227453';
    final url = Uri.parse('https://appgallery.huawei.com/app/$appId');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Не удалось открыть AppGallery';
    }
  }

  Future<void> checkGooglePlayServicesAvailability() async {
    GooglePlayServicesAvailability availability =
    await GoogleApiAvailability.instance.checkGooglePlayServicesAvailability();
    setState(() {
      isGooglePlayServicesAvailable = availability == GooglePlayServicesAvailability.success;
    });
  }
}