class User {
  String name;
  String id;
  String uid;
  String headImageuri;
  String phone;
  String school;
  String identity;
  String grade;
  String enterTime;
  String signState;

  User(
    this.name,
    this.id,
    this.uid,
    this.headImageuri,
    this.phone,
    this.school,
    this.identity,
    this.grade,
    this.enterTime,
    this.signState,
  );
  // 创建一个更新后的 User 实例
  User copyWith({String? signState}) {
    return User(
      name,
      id,
      uid,
      headImageuri,
      phone,
      school,
      identity,
      grade,
      enterTime,
      signState ?? this.signState, // 如果没有提供新值，则使用当前值
    );
  }

  @override
  String toString() {
    return 'User{name: $name, id: $id, uid: $uid, headImageuri: $headImageuri, phone: $phone, school: $school, identity: $identity, grade: $grade, enterTime: $enterTime, signState: $signState}';
  }
}
