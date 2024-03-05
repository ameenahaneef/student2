import 'package:finalexactt/screens/model.dart';
import 'package:sqflite/sqflite.dart';

late Database _db;

Future<void> initializeDatabase() async {
 _db = await openDatabase("student.db", version: 2, onCreate: (db, version) {
    db.execute('''
        CREATE TABLE student(
          id INTEGER PRIMARY KEY,
          course TEXT,
          name TEXT,
          age TEXT,
          place TEXT,
          imageurl TEXT,
          
         
          
        )
    ''');
   },onUpgrade: (db, oldVersion, newVersion) {
    if(oldVersion<2){
      db.execute('ALTER TABLE student ADD COLUMN batchname TEXT');
    }
   },
  
  );
}

Future<void> addStudent(StudentModel value) async {
  await _db.rawInsert(
    "INSERT INTO student (course,name,age,place,imageurl,batchname) VALUES (?, ?, ?, ?,?,?)",
    [value.course, value.name, value.age, value.place, value.imageurl,value.batchname],
  );
}

Future<List<Map<String, dynamic>>> getAllStudents() async {
  final _values = await _db.rawQuery("SELECT * FROM student");
  return _values;
}

Future<void> deleteStudent(int id) async {
  await _db.rawDelete('DELETE FROM student WHERE id = ?', [id]);
}

Future<void> updateStudent(StudentModel updatedStudent) async {
  await _db.update(
    'student',
    {
      'course': updatedStudent.course,
      'name': updatedStudent.name,
      'age': updatedStudent.age,
      'place': updatedStudent.place,
      'imageurl': updatedStudent.imageurl,
      'batchname':updatedStudent.batchname,
    },
    where: 'id = ?',
    whereArgs: [updatedStudent.id],
  );
}
