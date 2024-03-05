class StudentModel {
  int? id;
  String course;
  String name;
  String age;
  String place;
  String? imageurl;
  String batchname;

  StudentModel(
      {this.id,
      required this.course,
      required this.name,
      required this.age,
      required this.place,
      required this.imageurl,
      required this.batchname
      });

  
}
