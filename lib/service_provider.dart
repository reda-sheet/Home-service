class ServiceProvider {
  String name;
  String profession;
  String description;
  String phone;
  bool isIndividual;

  ServiceProvider(this.name, this.profession, this.description, this.phone,
      this.isIndividual);

  String get getName => name;
  String get getProfession => profession;
  String get getDescription => description;
  String get getPhone => phone;
  bool get getIsIndividual => isIndividual;

  @override
  String toString() {
    return 'Name: $name\nProfession: $profession\nPhone: $phone\nDescription: $description';
  }
}

List<ServiceProvider> providers = [
  ServiceProvider("Reda", "Electricians", "EEEE", "666666666", true),
  ServiceProvider("Hassan", "Plumber", "PPPP", "789456123", false),
  ServiceProvider("Hussein", "Carpenter", "CCCC", "456789123", true),
  ServiceProvider("Mohammad", "Electricians", "EEEE", "456123489", true),
  ServiceProvider("Mohsen", "Plumber", "PPPP", "999666333", false),
  ServiceProvider("Mahmoud", "Carpenter", "CCCC", "123123123", false),
  ServiceProvider("Ali", "Electricians", "EEEE", "123456789", true),
  ServiceProvider("Kassem", "Carpenter", "CCCC", "775533222", false),
  ServiceProvider("Bilal", "Plumber", "PPPP", "789333456", true),
  ServiceProvider("Ahmad", "Electricians", "EEEE", "456888222", true),
];
