
class AuthReponse {
    AuthReponse({
        this.id,
        this.token,
    });

    int? id;
    String? token;

    factory AuthReponse.fromJson(Map<String, dynamic> json) => AuthReponse(
        id: json["id"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
    };
}
