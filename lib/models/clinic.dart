class Clinic {
  int id;
  String name;
  String loc;

  Clinic(this.id, this.name, this.loc);

  static List<Clinic> samples = [
    Clinic(1, 'clinic 1', 'loc 1'),
    Clinic(2, 'clinic 2', 'loc 2'),
    Clinic(3, 'clinic 3', 'loc 3'),
    Clinic(4, 'clinic 4', 'loc 4'),
    Clinic(5, 'clinic 5', 'loc 5'),
    Clinic(6, 'clinic 6', 'loc 6'),
    Clinic(7, 'clinic 7', 'loc 7'),
    Clinic(8, 'clinic 8', 'loc 8'),
  ];
}

class Organization {
  int id;
  String name;
  String loc;
  String uRL;
  List<Clinic> clinics;

  Organization(this.id, this.name, this.loc, this.clinics, this.uRL);

  void addClinic(Clinic clinic) {
    clinics.add(clinic);
  }

  static List<Organization> samples = [
    Organization(1, 'org 1', 'loc 1', Clinic.samples, 'assets/w11.png'),
    Organization(2, 'org 2', 'loc 2', Clinic.samples, 'assets/w11.png'),
    Organization(3, 'org 3', 'loc 3', Clinic.samples, 'assets/w11.png'),
    Organization(4, 'org 4', 'loc 4', Clinic.samples, 'assets/w11.png'),
    Organization(5, 'org 5', 'loc 5', Clinic.samples, 'assets/w11.png'),
    Organization(6, 'org 6', 'loc 6', Clinic.samples, 'assets/w11.png'),
  ];
}
