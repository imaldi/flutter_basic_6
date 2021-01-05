class UserModel{
  final int id;
  final String name, username, email,phone,website;
  final Address address;
  final Company company;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory UserModel.fromJson(Map<String,dynamic> json){
    return new UserModel(
      id: json['id'],
      name: json['name'],
      username: json['email'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company']),
    );
  }
}

class Address{
  final String street, suite, city, zipcode;
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json){
    return new Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode']
    );
  }
}

class Company{
  final String name, catchPhrase, bs;

  Company({this.name,this.catchPhrase,this.bs});

  factory Company.fromJson(Map<String,dynamic> json){
    return new Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs']
    );
  }
}