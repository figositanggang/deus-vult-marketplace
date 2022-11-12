class UserClass {
  final String id;
  final String name;
  final String email;

  final String password;

  UserClass({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "name": this.name,
      "email": this.email,
      "password": this.password,
    };
  }

  String toString() =>
      "id: ${this.id}, name: ${this.name},email: ${this.email}, password: ${this.password},";
}
