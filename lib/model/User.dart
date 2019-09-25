class User {
final  String id;
 final String name;
 final String email;
 final String password;
 final String phone;
 final String countryCode;
  bool active = false;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.countryCode,
      this.phone,
      this.active});

    factory User.fromJson(Map<String,dynamic> json){
      return User(
        id:json['id'],
        name:json['name'],
        email:json['email'],
        password:json['password'],
        countryCode:json['countryCode'],
        phone:json['phone'],
        active:json['active'],

      );
    }


}

