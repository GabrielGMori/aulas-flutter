import 'package:flutter/material.dart';

class Receita extends StatelessWidget {
  const Receita({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receita de Bolo de Cenoura'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagem da Receita
            SizedBox(
              height: size.height * 0.3,
              child: Image.asset(
                'assets/images/bolo_cenoura.jpg', // Verifique o caminho de imagem
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Pontuação da Receita (Row de estrelas)
            Row(
              children: [
                for (int i = 0; i < 4; i++)
                  Icon(Icons.star, color: colorScheme.primary, size: 24),
                Icon(
                  Icons.star_half,
                  color: colorScheme.primary,
                  size: 24,
                ), // Meia estrela
                SizedBox(width: 8),
                Text('4.5 (250 avaliações)', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),

            // Seção de Ingredientes
            Section(
              title: 'Ingredientes',
              itens: [
                'Cenouras, Ovos, Óleo, Açúcar, Farinha, Fermento',
                'Cobertura: Açúcar, Chocolate em pó, Manteiga, Leite',
              ],
            ),

            SizedBox(height: 20),

            Section(
              title: 'Modo de Preparo',
              itens: [
                'Bata cenoura, ovos e óleo no liquidificador.',
                'Misture os líquidos com açúcar e farinha. Adicione o fermento por último.',
                'Asse em forno médio (180°C) por 30-40 minutos.',
                'Para a cobertura: Cozinhe todos os ingredientes em fogo baixo até engrossar. Despeje sobre o bolo quente.',
              ],
              enumerado: true,
            ),
          ],
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.title,
    required this.itens,
    this.enumerado = false,
  });

  final String title;
  final List<String> itens;
  final bool enumerado;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: colorScheme.tertiary,
          ),
        ),

        const SizedBox(height: 10),

        // Lista de items
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var (index, item) in itens.indexed)
              enumerado == true
                  ? Item.withNumbers(text: item, index: index + 1)
                  : Item(text: item, iconData: Icons.circle),
          ],
        ),
      ],
    );
  }
}

class Item extends StatelessWidget {
  const Item({super.key, required this.text, required this.iconData})
    : index = 1;
  const Item.withNumbers({super.key, required this.text, required this.index})
    : iconData = null;

  final String text;
  final int? index;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (iconData != null
            ? Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Icon(
                  iconData,
                  size: 8,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            : Text("$index.")),
        SizedBox(width: 4),
        Expanded(child: Text(text)),
      ],
    );
  }
}
