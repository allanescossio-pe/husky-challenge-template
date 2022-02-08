# Racional

Versões: 
  - Rails 7
  - Ruby 3.1.0

A API foi isolada do front por conta da modularidade e pela liberdade de reutilização da mesma por outros aplicativos. Um bom motivo também é sobre a manipulação das requisições. Neste modelo é possível trabalhar com mecanismos de feedback pelo lado do cliente enquando as requisições são executadas e, em caso de erro, é possível apenas mandar um alerta na tela sem que a aplicação quebre por completo.

Foi criado um projeto base(Rails Engine) que é incorporado ao principal através do `Gemfile`. Dentro do projeto são criadas classes que herdam destas classes base e servem se referência para criação das suas derivadas. É possível ver este exemplo abrindo a classe `ApplicationService`. Ela apenas herda de `Application::Base::Service` e ainda não tem nada implementado, mas a idéia é que se surgir alguma particularidade deste projeto, esta seja implementada dentro da `ApplicationService` .

As regras de negócio estão separadas em services modularizados. Um dos princípios que mais foi tido cuidado de não violar foi o do SRP, tentei também respeitar ao máximo o contrato entre as classes e praticar o DRY.
Nos controllers foi usado um padrão restful adaptado para o rails, onde os unicos métodos implementados são `index, show, create, update e delete`. A ideia é evitar o crescimento desordenado dos controllers, separar responsabilidades e fica até mais fácil identificar onde está cada endpoint olhando apenas o nome do arquivo.

Toda a construção foi feita baseada em testes. Podemos considerar a aplicação 100% testada. A medição real está com 93.81% por conta que não configurei para ignorar algumas classes base, como por exemplo, a `ApplicationJob`. A maioria dos conceitos utilizados nos testes foi respeitando o que é pregado nas boas práticas definidas no `BetterSpecs`.

A ideia inicial era, após finalizar a API e criar uma applicação client, porém tive muitos contratempos que me impediram de completar o teste como desejava. Abaixo segue as pendências:
- Criação de client em ReactJS
- Configurar Docker
- Documentar utilizando swagger. Este eu até tentei, mas tive contratempos, aparentemente por incompatibilidade da gem com o rails 7.
- Criar, no projeto base, classes de referências para os testes.

> master.key: 5e35f9cc4c18518a86bbfe53ae5d5e62

## Execução
- Configurar o `database.yml` de acordo com o exemplo que está no projeto base da Husky. Não foi colocado nenhuma configuração no credentials.
- Executar `bundle install`
- Iniciar aplicação com `rails s`
