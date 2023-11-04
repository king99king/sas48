import 'package:flutter/material.dart';
import 'package:sas48/Requests.dart';
import 'package:sas48/volunteerAlerts.dart';

import 'AddNotifierTocenter.dart';
import 'CiticensDataEnter.dart';
import 'volunteer.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const AddItemToStore(),
    const Volunteer(),
    const VolunteerAlerts(),
    const AddNotifierToCenter(),
    const Requests(),
    // const SalaryBonus(),
    // const AddNewUser(),
    // const Attendance(),
    // const SendWeekend(),
    // const ModifyUsersData(),
    // const ExportDataScreen(),
    // const HistoryDataScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: true,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt),
            label: ('Citizens'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: ('Map'),
          ),BottomNavigationBarItem(
            icon: Icon(Icons.notifications_on_sharp),
            label: ('Alerts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important),
            label: ('Notify Center'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_help_outlined),
            label: ('Request Help'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff692F45),
        onTap: _onItemTapped,
      ),
    );
  }
}
