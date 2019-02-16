class User {
  final String token;
  final String username;
  final String email;
  final String avatar;

  User({
    this.token,
    this.username,
    this.email,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        token: json['user']['token'],
        username: json['user']['username'],
        email: json['user']['email'],
        avatar: json['user']['avatar'],
    );
  }
}