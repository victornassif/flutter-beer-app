class Cerveja {
  double alcool, preco;
  String nome, imagemUrl, tipo;
  int id;

  String get precoStr {
    return "R\$$preco";
  }

  Cerveja(
      {this.id, this.preco, this.alcool, this.imagemUrl, this.nome, this.tipo});

  factory Cerveja.fromJson(Map<String, dynamic> parsedJson) {
    return Cerveja(
        id: parsedJson['id'].toInt() as int,
        alcool: parsedJson['alcool'].toDouble() as double,
        imagemUrl: parsedJson['url'] as String,
        nome: parsedJson['nome'] as String,
        tipo: parsedJson['tipo'] as String,
        preco: parsedJson['preco'].toDouble() as double,
      );
  }
}
