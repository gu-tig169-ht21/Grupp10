import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'consumption_tab.dart';
import 'economy_tab.dart';
import '../history.dart';
import '../new_product.dart';
import '../forecast.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/show_modal_bottom_sheet.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final appIsFirstLoaded = 'is_first_loaded';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void openMenu() {
    ShowModalBottomSheet.runShowModalButtomSheet(context);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: const Color(0xff202020),
              title: const Text('Nicotine Tracker',
                  style: TextStyle(color: Colors.white)),
              leading: IconButton(
                color: const Color(0xff464646),
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => openMenu(),
              ),
              bottom: _selectedIndex == 0
                  ? TabBar(
                      tabs: <Widget>[
                          Tab(
                              child: (Text('Konsumtion',
                                  style: GoogleFonts.raleway(fontSize: 13)))),
                          Tab(
                              child: Text('Ekonomi',
                                  style: GoogleFonts.raleway(fontSize: 13))),
                        ],
                      indicatorColor: Colors.transparent,
                      labelStyle: const TextStyle(fontSize: 12),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 12,
                      ))
                  : null),
          bottomNavigationBar: BottomNav(_selectedIndex, _onItemTapped),
          body: _selectedIndex == 0
              ? const TabBarView(
                  children: [ConsumptionTab(), EconomyTab()],
                )
              : _selectedIndex == 1
                  ? const History()
                  : const Forecast(),
        ));
  }

  showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLoaded = prefs.getBool(appIsFirstLoaded);
    if (isFirstLoaded == null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: Colors.black45,
              title: const Text(
                'Greetings Traveler',
                style: TextStyle(color: Colors.white),
              ),
              content: const Text(
                'Börja med att lägga till ditt val av snus \n(detta kan när som helst ändras i menyn)',
                style: TextStyle(color: Colors.white),
              ),
              actions: <Widget>[
                TextButton(
                    child: const Text(
                      'Välj Snus',
                      style: TextStyle(color: Color(0xff699985)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewProduct()));
                      prefs.setBool(appIsFirstLoaded, false);
                    })
              ],
            );
          });
    }
  }
}
