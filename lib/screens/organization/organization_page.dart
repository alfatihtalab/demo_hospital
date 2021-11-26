import 'package:demo_hospital/models/clinic.dart';
import 'package:demo_hospital/screens/organization/organization.dart';
import 'package:demo_hospital/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class OrganizationPage extends StatefulWidget {
  const OrganizationPage({Key? key}) : super(key: key);

  @override
  _OrganizationPageState createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  // controls the text label we use as a search bar
  final TextEditingController _filter = TextEditingController();
  Icon _searchIcon = const Icon(Icons.search);
  String _searchText = "";
  List<Organization> filteredNames =
      <Organization>[]; // names filtered by search text
  Widget _appBarTitle = const Text('Organization');
  int _selectedIndex = 0;

  //static List<Widget> _pages = [OrganizationList(), BookingPage()];

  @override
  void initState() {
    // TODO: implement initState
    _selectedIndex = 1;
    super.initState();
  }

  Widget _body = const OrganizationList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBarTitle,
        actions: [
          IconButton(
              onPressed: () {
                _searchPressed();
              },
              icon: _searchIcon),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ProfilePage();
              }));
            },
          )
        ],
      ),
      body: SafeArea(
          child: SizedBox(
        child: _body,
        height: double.infinity,
      )),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.request_page_outlined),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism),
            label: 'Doctors',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        iconSize: 28.0,
        selectedFontSize: 18.0,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple.shade900,
        onTap: _onItemTapped,
        backgroundColor: Colors.deepPurple.shade100,
      ),
    );
  }

  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = const Icon(Icons.close);
        _appBarTitle = TextField(
          textDirection: TextDirection.rtl,
          style: const TextStyle(color: Colors.white),
          controller: _filter,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintTextDirection: TextDirection.rtl,
              hintText: 'بحث ...'),
        );
      } else {
        this._searchIcon = Icon(Icons.search);
        _appBarTitle = Text('Organization');
        // filteredNames = names;
        _filter.clear();
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        _appBarTitle = const Text('My bookings');
        _body = const Center(child: Text('Booking'));
      } else if (_selectedIndex == 1) {
        // this._action = [
        //   IconButton(
        //       onPressed: () {
        //         _searchForClince();
        //       },
        //       icon: _searchIcon)
        // ];
        _appBarTitle = const Text('Organizations');
        _body = const OrganizationList();
      } else if (_selectedIndex == 2) {
        _appBarTitle = const Text('Doctors');
        // this._action = [];
        _body = const Center(child: Text('Doctors'));
      }
      print(_selectedIndex);
    });
  }

  // void _buildSearchedList() {
  //   if (!(_searchText.isEmpty)) {
  //     List<Organization> tempList = <Organization>[];
  //     for (int i = 0; i < filteredNames.length; i++) {
  //       if (filteredNames[i]['name']
  //           .toLowerCase()
  //           .contains(_searchText.toLowerCase())) {
  //         tempList.add(filteredNames[i]);
  //       }
  //     }
  //     filteredNames = tempList;
  //   }
  //   return ListView.builder(
  //     itemCount: names == null ? 0 : filteredNames.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       return new ListTile(
  //         title: Text(filteredNames[index]['name']),
  //         onTap: () => print(filteredNames[index]['name']),
  //       );
  //     },
  //   );
  // }
}
