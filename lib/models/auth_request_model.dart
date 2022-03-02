class AuthRequest {
    AuthRequest({
        this.email,
        this.password,
    });

    String? email;
    String? password;

    factory AuthRequest.fromJson(Map<String, dynamic> json) => AuthRequest(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
