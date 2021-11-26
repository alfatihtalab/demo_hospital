import 'dart:async';

import 'package:demo_hospital/models/clinic.dart';
import 'package:flutter/material.dart';

class OrganizationList extends StatefulWidget {
  const OrganizationList({
    Key? key,
  }) : super(key: key);

  @override
  _OrganizationListState createState() => _OrganizationListState();
}

class _OrganizationListState extends State<OrganizationList> {
  var _organizaions;

  @override
  void initState() {
    // TODO: implement initState
    _organizaions = getOrganization();
    super.initState();
  }

  //TODO get the data from the api
  Future<List<Organization>> getOrganization() async {
    // final response = await orgnaization.get('https://url');
    // Timer(const Duration(seconds: 20), () {});
    await Future.delayed(const Duration(seconds: 5));
    List<Organization> tempList = Organization.samples;
    //print(tempList);
    return tempList;

    // for (int i = 0; i < response.data['results'].length; i++) {
    //   tempList.add(response.data['results'][i]);
    // }
    //
    // setState(() {
    //   names = tempList;
    //   filteredNames = names;
    // });
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'One';

    print(_organizaions);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          padding: EdgeInsets.all(4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(flex: 1, child: Text('select hospital')),
              Expanded(
                flex: 2,
                child: DropdownButton(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          padding: EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(flex: 1, child: Text('select clinic')),
              Expanded(
                flex: 2,
                child: DropdownButton(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: getOrganization(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return OrganizationDetail(
                                  organization: snapshot.data[index]);
                            }));
                          },
                          child: bulidOrganizationCard(snapshot.data[index],
                              snapshot.data[index].uRL, context),
                        );
                      });
                } else if (snapshot.hasError) {
                  return const Center(child: Icon(Icons.error_outline));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ],
    );
  }
}

Widget bulidOrganizationCard(
    Organization org, String imgUrl, BuildContext context) {
  return Card(
    elevation: 5.0,
    shadowColor: Colors.deepPurple.shade200,
    // 2
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    // 3
    margin: const EdgeInsets.all(10),
    child: Container(
      padding: EdgeInsets.all(16.0),
      constraints:
          const BoxConstraints.expand(width: double.infinity, height: 170),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.cover),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 8,
            child: Text(
              org.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          // 5
          // 6
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  org.loc,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w200,
                    fontFamily: 'Palatino',
                  ),
                ),
                Text('Number of Clincs: ${Organization.samples.length}')
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class OrganizationDetail extends StatefulWidget {
  final Organization organization;

  const OrganizationDetail({Key? key, required this.organization})
      : super(key: key);

  @override
  _OrganizationDetailState createState() => _OrganizationDetailState();
}

class _OrganizationDetailState extends State<OrganizationDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.organization.name),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Image(
                  image: AssetImage(widget.organization.uRL),
                ),
              ),
            ),
            // 5
            const SizedBox(
              height: 4,
            ),
            // 6
            Text(
              widget.organization.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            // TODO: Add Expanded
            // 7
            Expanded(
              // 8
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.organization.clinics.length,
                itemBuilder: (BuildContext context, int index) {
                  final clinic = widget.organization.clinics[index];
                  // 9
                  // TODO: Add ingredient.quantity
                  return Text('${clinic.name} ${clinic.loc}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
