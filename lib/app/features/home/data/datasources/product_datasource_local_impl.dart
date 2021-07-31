import 'dart:convert';

import 'package:shopys/app/core/error/failures.dart';
import 'package:shopys/app/core/http_client/http_client.dart';
import 'package:shopys/app/features/home/data/datasources/product_datasource.dart';
import 'package:shopys/app/features/home/data/models/product_model.dart';

//TODO: Realizar testes unitários
class ProductLocalDataSource implements IProductDataSource {
  final HttpClient client;

  ProductLocalDataSource(
    this.client,
  );

  @override
  Future<List<ProductModel>> getProductList() async {
    String mockData = '''
      [
        {
          "description": "Versátil e ultraconfortável para a academia, treinos leves de corrida, caminhada ou mesmo ocasiões casuais, o Tênis Nike Revolution 5 é perfeito para cumprir a rotina diária. Seu cabedal (parte superior do tênis) apresenta a leveza e respirabilidade do mesh (malha em tramas abertas) para manter o frescor com mais flexibilidade nos movimentos. Em toda a extensão da entressola do Nike Revolution 5, a maciez e suavidade da espuma combina leve e duradouro amortecimento. Já o solado do Nike Revolution Masculino garante excelente tração e uma distribuição natural das passadas. Não perca a oportunidade e aproveite o preço para comprar! ",
          "name": "Tênis Nike Revolution 5 - Masculino",
          "photoUrl": "https://imgcentauro-a.akamaihd.net/900x900/9431370R/tenis-nike-revolution-5-masculino-img.jpg",
          "price": 24999
        },
        {
          "description": "Peça curinga para compor looks confortáveis e diversificados em todos os momentos do dia a dia, esse Agasalho Oxer Polytricot apresenta jaqueta com gola alta para a proteção nos dias frios e bolsos frontais que facilitam guardar itens com segurança. Em poliéster que proporciona maciez, durabilidade e ótimo caimento, o agasalho de frio apresenta calça com cós elástico para ajuste personalizado e corte padrão para naturalidade dos movimentos. Prático e versátil, o Agasalho Oxer Masculino é um excelente custo-benefício para os melhores momentos do seu dia. Aproveite o ótimo preço e a qualidade Oxer no site ou aplicativo da Centauro e compre já o seu! ",
          "name": "Conjunto de Agasalho Oxer Polytricot - Masculino",
          "photoUrl": "https://imgcentauro-a.akamaihd.net/900x900/9269525G/conjunto-de-agasalho-oxer-polytricot-masculino-img.jpg",
          "price": 12999
        },
        {
          "description": "Una seu estilo ao conforto, com essa Jaqueta de Moletom adidas, é a opção ideal em diversas ocasiões. Confeccionada em poliéster, proporciona leveza e bem-estar. A Jaqueta conta também com bolsos frontais, que facilitam o transporte de seus pertences. Não perca a chance e abuse da versatilidade no look, compre já!",
          "name": "Jaqueta de Moletom Adidas com Capuz Logo Linear - Feminina",
          "photoUrl": "https://imgcentauro-a.akamaihd.net/900x900/957832NF/jaqueta-de-moletom-adidas-com-capuz-logo-linear-feminina-img.jpg",
          "price": 23999
        }
      ]
    ''';

    final response = HttpResponse(data: mockData, statusCode: 200);
    await Future.delayed(Duration(seconds: 3));
    if (response.statusCode == 200) {
      print(json.decode(response.data));
      return (json.decode(response.data) as List).map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw ServerFailure();
    }
  }
}
