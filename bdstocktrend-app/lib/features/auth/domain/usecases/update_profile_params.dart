class UpdateProfileParams {
  final String? name;
  final String? mobile;
  final String? photoUrl;

  UpdateProfileParams({this.name, this.mobile, this.photoUrl});

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (mobile != null) 'mobile': mobile,
        if (photoUrl != null) 'photoUrl': photoUrl,
      };
}
