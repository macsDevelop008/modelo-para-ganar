import 'dart:math';

//! Genera un string aleatorio que funciona como identificación de usuario
String generateRandomIdentification(int length) {
  const String digits = '0123456789';
  Random random = Random();
  return List.generate(length, (index) => digits[random.nextInt(digits.length)])
      .join();
}

//! Genera un correo con formato valido aleatorio
String generateRandomEmail() {
  const List<String> names = [
    'user',
    'example',
    'test',
    'demo',
    'sample1',
    'sample2',
    'sample3',
    'sample4',
    'sample5',
    'sample6',
  ];
  const List<String> domains = [
    'gmail.com',
    'yahoo.com',
    'hotmail.com',
    'example.com',
    'testA.com',
    'testB.com',
    'testC.com',
    'testD.com',
    'testF.com',
    'testG.com',
    'testH.com',
  ];

  Random random = Random();

  // Generar un nombre de usuario aleatorio
  String name = names[random.nextInt(names.length)];
  int number = random.nextInt(1000); // Número entre 0 y 999
  String domain = domains[random.nextInt(domains.length)];

  return '$name$number@$domain';
}
