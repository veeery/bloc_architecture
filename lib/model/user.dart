class User {

  String id;
  String email;
  String firstName;
  String? lastName;
  String? avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    this.lastName,
    this.avatar
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        avatar = json['avatar'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'avatar': avatar,
      };

  @override
  String toString() {
    return 'User{id: $id, email: $email, firstName: $firstName, lastName: $lastName, avatar: $avatar}';
  }

  List<Object> get props => [id, email, firstName, lastName!, avatar!];

}