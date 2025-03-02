class Paciente {
  final String? id;
  final String nome;
  final String email;
  final String cpf;
  final String dataNascimento;
  final String sexo;
  final double altura;
  final double peso;
  final double circunferenciaAbdominal;
  final double gorduraCorporal;
  final double massaMuscular;
  final List<String> alergias;
  final List<String> preferencias;
  final String senha;

  Paciente({
    this.id,
    required this.nome,
    required this.email,
    required this.cpf,
    required this.dataNascimento,
    required this.sexo,
    required this.altura,
    required this.peso,
    required this.circunferenciaAbdominal,
    required this.gorduraCorporal,
    required this.massaMuscular,
    required this.alergias,
    required this.preferencias,
    required this.senha,
  });

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
      id: json['id'] ?? '',
      nome: json['nome'] ?? '',
      email: json['email'] ?? '',
      cpf: json['cpf'] ?? '',
      dataNascimento: json['dt_nascimento'] ?? '',
      sexo: json['sexo'] ?? '',
      altura: json['altura'].toDouble() ?? 0.0,
      peso: json['peso'].toDouble() ?? 0.0,
      circunferenciaAbdominal:
          json['circunferencia_abdominal'].toDouble() ?? 0.0,
      gorduraCorporal: json['gordura_corporal'].toDouble() ?? 0.0,
      massaMuscular: json['massa_muscular'].toDouble() ?? 0.0,
      alergias: List<String>.from(json['alergias'] ?? []),
      preferencias: List<String>.from(json['preferencias'] ?? []),
      senha: json['senha'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'cpf': cpf,
      'dt_nascimento': dataNascimento,
      'sexo': sexo,
      'altura': altura,
      'peso': peso,
      'circunferencia_abdominal': circunferenciaAbdominal,
      'gordura_corporal': gorduraCorporal,
      'massa_muscular': massaMuscular,
      'alergias': alergias,
      'preferencias': preferencias,
    };
  }

  Paciente copyWith({
    String? id,
    String? nome,
    String? email,
    String? cpf,
    String? dataNascimento,
    String? sexo,
    double? altura,
    double? peso,
    double? circunferenciaAbdominal,
    double? gorduraCorporal,
    double? massaMuscular,
    List<String>? alergias,
    List<String>? preferencias,
    String? senha,
  }) {
    return Paciente(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      cpf: cpf ?? this.cpf,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      sexo: sexo ?? this.sexo,
      altura: altura ?? this.altura,
      peso: peso ?? this.peso,
      circunferenciaAbdominal:
          circunferenciaAbdominal ?? this.circunferenciaAbdominal,
      gorduraCorporal: gorduraCorporal ?? this.gorduraCorporal,
      massaMuscular: massaMuscular ?? this.massaMuscular,
      alergias: alergias ?? this.alergias,
      preferencias: preferencias ?? this.preferencias,
      senha: senha ?? this.senha,
    );
  }

  @override
  String toString() {
    return 'Paciente(id: $id, nome: $nome, email: $email, cpf: $cpf, dataNascimento: $dataNascimento, sexo: $sexo, altura: $altura, peso: $peso, circunferenciaAbdominal: $circunferenciaAbdominal, gorduraCorporal: $gorduraCorporal, massaMuscular: $massaMuscular, alergias: $alergias, preferencias: $preferencias)';
  }
}
