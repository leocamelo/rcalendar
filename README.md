# rCalendar
Uma simples e enxuta API de calendário feita com [Ruby on Rails](http://rubyonrails.org/)

## Iniciando
Apenas clone este repositório no seu ambiente local ou no seu servidor,
intale as dependências com bundle, inicie um banco de dados e está
pronto para adicionar seus eventos!

```bash
$ git clone https://github.com/leonardocamelo/rcalendar.git
$ bundle install
$ rake db:setup
$ unicorn # ou 'rails server' em ambiente de desenvolvimento
```
*rCalendar está configurado e foi testado apenas com o db Postgresql*

## Primeiras requisições
O rCalendar está preparado para requisições com o padrão REST e responderá
com o formato [JSON](http://json.org/) de serialização. Seguem as principais
rotas e suas utilidades:

```
METODO | CAMINHO            | UTILIDADE
---------------------------------------
GET    | /api/v1/events     | Lista todos os eventos deste ano, a partir deste mês
POST   | /api/v1/events     | Adiciona um evento no calendário
PATCH  | /api/v1/events/:id | Atualiza o evento referenciado pela :id na rota
```

Para mais informações das utilidades acima, como parâmetros e formatos, além de
exemplos em algumas linguagens, visite o [Demo Online](https://rcalendar.herokuapp.com) da api.

## Próximas tarefas
- Traduzir a documentação e os exemplos para inglês
- Configurar integração com [Travis CI](https://travis-ci.org/)
- Adicionar sistema de seguraça com tokens
- Adicionar action destroy ao crud
- Criar exemplos em mais linguagens

## Contribua
Gostou do projeto e quer contribuir com algo?
1. Faça um fork do repositório
2. Adicione suas correções ou novas features
3. Não se esqueça dos testes, use [RSpec](http://rspec.info/)
4. Submeta um pull request, vai ser bem legal :D
