class User {
  late String name,
      lastName,
      cpf,
      email,
      cep,
      address,
      number,
      city,
      neighborhood,
      password,
      confirmPassword;

  User({
    required this.name,
    required this.lastName,
    required this.email,
    required this.address,
    required this.city,
    required this.neighborhood,
    required this.password,
    required this.confirmPassword,
    required this.cpf,
    required this.cep,
    required this.number,
  });
}
