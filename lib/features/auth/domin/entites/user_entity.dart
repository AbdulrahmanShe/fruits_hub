class UserEntity {
  final String name;
  final String email;
  final String uId;
  final String role;
  final String phone;
  final String gender;

  UserEntity({
    required this.name,
    required this.email,
    required this.uId,
    this.role = 'viewer',
    this.phone = '',
    this.gender = 'male',
  });
}
