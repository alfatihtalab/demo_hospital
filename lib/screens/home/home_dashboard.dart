import 'package:demo_hospital/screens/organization/organization_page.dart';
import 'package:flutter/material.dart';

import '../../app_theme.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    var _key = GlobalKey();
    final theme = DemoTheme.light();
    List<Widget> cards = [
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return OrganizationPage();
          }));
        },
        child: Container(
          padding: EdgeInsets.all(16),
          // constraints: BoxConstraints.expand(width: 120, height: 200),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'All Hospitals',
                style: theme.textTheme.headline2,
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.purple.shade200,
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
        ),
      ),
      GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Text(
                'My Bookings',
                style: DemoTheme.darkTextTheme.headline2,
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.indigo.shade400,
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          //constraints: BoxConstraints.expand(width: 120, height: 200),
        ),
      ),
      GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Text(
                'Corona Vaccine',
                style: DemoTheme.darkTextTheme.headline2,
              ),
              // Positioned(
              //   child: LayoutBuilder(
              //     builder: (BuildContext context, BoxConstraints constraints) {
              //       return Image(
              //         height: constraints.maxHeight / 2,
              //         image: AssetImage('assets/hospital.png'),
              //         fit: BoxFit.fill,
              //       );
              //     },
              //   ),
              // )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.lightBlue.shade700,
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          //constraints: BoxConstraints.expand(width: 120, height: 200),
        ),
      ),
      GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text("one"),
            color: Colors.teal[100],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text("Two"),
            color: Colors.teal[100],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text("Three"),
            color: Colors.teal[200],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text("Four"),
            color: Colors.teal[300],
          ),
        ],
      ),
      GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Text(
                'My Appointments',
                style: DemoTheme.lightTextTheme.headline2,
              ),
              // Positioned(
              //   child: LayoutBuilder(
              //     builder: (BuildContext context, BoxConstraints constraints) {
              //       return Image(
              //         height: constraints.maxHeight / 2,
              //         image: AssetImage('assets/hospital.png'),
              //         fit: BoxFit.fill,
              //       );
              //     },
              //   ),
              // )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.redAccent.shade100,
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          //constraints: BoxConstraints.expand(width: 120, height: 200),
        ),
      ),
    ];
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          GestureDetector(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(8),
              constraints:
                  BoxConstraints.expand(width: double.infinity, height: 130),
              child: Stack(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: FittedBox(
                          child: Icon(
                            Icons.account_circle,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi, Mohammed',
                              style: DemoTheme.lightTextTheme.headline2,
                            ),
                            Text(
                              'How can we take care about yourself?',
                              style: DemoTheme.lightTextTheme.headline3,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: 10,
                      right: 10,
                      child: Column(
                        children: [
                          Text(
                            'Total orders: 9 ',
                          ),
                          Text('account type: pro '),
                        ],
                      ))
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.amberAccent.shade200,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              //constraints: BoxConstraints.expand(width: 120, height: 200),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              children: cards,
              padding: const EdgeInsets.all(8),
            ),
          ),
        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
