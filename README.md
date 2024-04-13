# Desafio API
Criar um endpoint que faça a leitura de um arquivo .csv, popule o banco de dados com essas informações e com isso será necessário exibir todos os registros em json.

## Requisitos:

> ● O desafio deve ser desenvolvido utilizando Ruby e tendo o Rails como framework;
> ● Seguindo o padrão API RESTful;
> ● Seguir o Rubocop style-guide;
> ● A leitura do arquivo .csv deve ser através de um endpoint diferente da listagem de títulos;
> ● Ordenar pelo ano de lançamento;
> ● Filtrar os registros por ano de lançamento, gênero, país*;
> ● Garantir que não haja duplicidade de registros;
> ● O projeto deve ser disponibilizado em um repositório aberto no GitHub. Envie a URL assim que possível;
> ● A response do endpoint deve obedecer o padrão abaixo:

```json
[  
  {
        "id": 656,
        "title": "13 Reasons Why",
        "genre": "TV Show",
        "release_year": "2020",
        "country": "United States",
        "date_added": "2020-06-05",
        "description": "After a teenage girl's perplexing suicide, a classmate receives a series of tapes that unravel the mystery of her tragic choice."
    }
]
``` 


Dicas:
● Testes são bem-vindos;;
● Tipo de banco de dados em aberto, pode escolher tanto relacional quanto não relacional;
● O filtro pode ser aplicado por 1 ou mais itens, mas devem atender aos requisitos;
● O arquivo .csv, entitulado [netflix_titles.csv](https://github.com/vanderleipinto/TT4/blob/main/app/data/TT_%204%20-%20netflix_titles.csv), poderá ser encontrado no anexo do email com o desafio;
