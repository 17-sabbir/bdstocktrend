class UserDto {
  final int? id;
  final String? username;
  final String? email;
  final String? name;
  final String? mobile;
  final String? photoUrl;
  final List<String>? roles;

  UserDto({
    this.id,
    this.username,
    this.email,
    this.name,
    this.mobile,
    this.photoUrl,
    this.roles,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      mobile: json['mobile'] as String?,
      photoUrl: json['photoUrl'] as String?,
      roles: json['roles'] != null
          ? List<String>.from(json['roles'] as List)
          : null,
    );
  }
}
