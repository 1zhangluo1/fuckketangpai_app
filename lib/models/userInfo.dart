class User {
  final String name;
  final String id;
  final String uid;
  final String headImageuri;
  final String phone;
  final String school;
  final String identity;
  final String grade;
  final String enterTime;

  const User(
    this.name,
    this.id,
    this.uid,
    this.headImageuri,
    this.phone,
    this.school,
    this.identity,
    this.grade,
    this.enterTime,
  );

  @override
  String toString() {
    return 'User{name: $name, id: $id, uid: $uid, headImageuri: $headImageuri, phone: $phone, school: $school, identity: $identity, grade: $grade, enterTime: $enterTime}';
  }

}
