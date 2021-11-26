import 'package:demo_hospital/models/clinic.dart';
import 'package:flutter/material.dart';

class HospitalsPage extends StatefulWidget {
  const HospitalsPage({Key? key}) : super(key: key);

  @override
  _HospitalsPageState createState() => _HospitalsPageState();
}

class _HospitalsPageState extends State<HospitalsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Clinic.samples.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: bulidHospitalCard(Clinic.samples[index]),
          );
        });
  }
}

Widget bulidHospitalCard(Clinic clinic) {
  return Card(
    elevation: 2.0,
    // 2
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    // 3
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      // 4
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            clinic.name,
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          // 5
          const SizedBox(
            height: 14.0,
          ),
          // 6
          Text(
            clinic.loc,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Palatino',
            ),
          )
        ],
      ),
    ),
  );
}
