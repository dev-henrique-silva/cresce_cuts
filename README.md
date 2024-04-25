# Aplicativo Vale Vantagens - Gestor de Campanhas de Desconto

Projeto desenvolvido em Flutter, consumindo dados sa [Fake Store API](https://fakestoreapi.com). Flutter Modular, armazenamento local com SQFlite e gerência de estado com Mobx.
<br>
O objetivo do aplicativo é criar uma campanhas de descontos. Selecionando os produtos que da lista principal e criando ou agendando campanhas de descontos em cada produto. É possivel criar campanhas com:

**Percentual:** Dando um desconto com base na porcentagem escolhida.
**De: Por:** Dando desconto no produto, exibindo o valor antigo ao lado do atual.
**Leve Pague:** Dando um produto de brindo na compra de uma certa quantidade de produto.

## Funcionalidades:

<ul>
  <li> Exibir lista de produtos </li>
  <li> Visualização dos produtos.</li>
  <li> Criar uma campanha a partir de um produto.</li>
  <li> Criar um novo produto para a campanha.</li>
  <li> Visualizar uma campanha.</li>
  <li> Agendar uma campanha.</li>
  <li> Inativar ou reativar uma campanha.</li>
  <li> Editar uma campanha.</li>
  <li> Escolher campanha entre os tipos: Percentual, De: Por:, Leve Pague.</li>
  <li> Excluir uma ou todas as campanhas.</li>
</ul>

## Ferramentas:

<ul>
  <li> Versão do Flutter: 3.16.6</li>
  <li> Flutter Modular</li>
  <li> Injeção de dependência</li>
  <li> Navegação com rotas nomeadas</li>
  <li> Gerência de estado: Mobx</li>
  <li> Armazenamento de dados local: SQFlite</li>
  <li> Consumo de API:  Fake Store API (https://fakestoreapi.com).</li>
</ul>

## Passo a passo para a execução do app
# Home
<ul>
  <li> Será feito a requisição para buscar e exibir a lista de produtos.</li>
  <li> Ao clicar no botão Desconto, você será redirecionado para a tela de lista de desconto.</li>
  <li> Ao clicar em um dos card, poderá ser visualizado o produto.</li>
  <li> Ao clicar no botão Cadastrar desconto, irá abrir um BottomSheet com os tipos de descontos diponíveis.</li>
  <li> Ao escolher um dos descontos, você será redirecionado para a tela de cadastrar desconto.</li>
</ul>

# Tela de Desconto
<ul>
  <li> Ira ser exibido uma lista com os desconto já criados, caso existam.</li>
  <li> Ao clicar no botão Cadastrar desconto, irá abrir um BottomSheet com os tipos de descontos diponíveis.</li>
  <li> Ao clicar em um dos card, poderá ser visualizado o desconto.</li>
  <li> Ao clicar no botão Switch, poderá ativar ou desativar uma campanha.</li>
  <li> Ao arrastar o card para o lado esquerdo, poderá excluir o desconto.</li>
  <li> Na parte superior, ao clicar no ícone de lixeira, poderá escluir todos os seus descontos.</li>
</ul>

# Tela de Cadastro de Desconto
<ul>
  <li> Irá exibir os componentes referentes ao tipo de desconto escolhido.</li>
  <li> Caso você esteja editando um desconto ou venha da tela de visualizar produto, algumas informações já estarão preenchidas.</li>
  <li> O não preencimento de um dos campos, exibirá um mensagem informando que todos os campos devem ser preenchidos.</li>
  <li> Poderá escolher uma image local do seu dispositivo para adicionar ao desconto.</li>
  <li> Ao finalizar com sucesso o cadastro ou edição de um desconto, será redirecionado para a lista de desconto.</li>
</ul>

## Telas:

<table style = {border: "none"}>


  <tr>
     <td style="text-align:center;" width="240"><img src="https://github.com/dev-henrique-silva/dev-henrique-silva/assets/81243358/f4d84415-ae4c-43f4-8c1d-5490f0a4ae7b" 
         alt="Splash Screen"/></td>
     <td style="text-align:center;" width="240" ><img src="https://github.com/dev-henrique-silva/dev-henrique-silva/assets/81243358/ca6a1987-dd14-47fd-befa-14bbb6539ca6" 
         alt="Home Skeleton"/></td>
     <td style="text-align:center;" width="240"><img src="https://github.com/dev-henrique-silva/dev-henrique-silva/assets/81243358/07009d0d-e045-4a21-a696-69398650cadc" 
         alt="Home"/></td>
     <td style="text-align:center;" width="240" ><img src="https://github.com/dev-henrique-silva/dev-henrique-silva/assets/81243358/8185a64d-86dd-455b-a2c9-6569a922b5ab" 
         alt="View Product"/></td>
     <td style="text-align:center;" width="240"><img src="https://github.com/dev-henrique-silva/dev-henrique-silva/assets/81243358/801ad9e5-07d2-4640-9016-291c40ad7eee" 
         alt="Show Bottom Sheet"/></td>
 <tr>
</table>

<br>

<table style = {border: "none"}> 
 <tr>
     <td style="text-align:center;" width="240"><img src="https://github.com/dev-henrique-silva/dev-henrique-silva/assets/81243358/77656f25-8a53-4e55-ac03-c9516c8123f1" 
         alt="Discount Skeleton"/></td>
     <td style="text-align:center;" width="240"><img src="https://github.com/dev-henrique-silva/dev-henrique-silva/assets/81243358/09af0c6a-d01a-44d0-8dc4-bac5e402021e" 
         alt="Discount"/></td>
     <td style="text-align:center;" width="240"><img src="https://github.com/dev-henrique-silva/dev-henrique-silva/assets/81243358/f637ed42-790a-4dec-b6e0-ce294ce4dbc2" 
         alt="Delete Discount"/></td>
     <td style="text-align:center;" width="240"><img src="https://github.com/dev-henrique-silva/dev-henrique-silva/assets/81243358/33f22f1b-9bc5-444d-9813-71eac5d7fedd" 
         alt = "Details Discount" /></td>
     <td style="text-align:center;" width="240"><img src="https://github.com/dev-henrique-silva/dev-henrique-silva/assets/81243358/e1fdc427-7fa8-4397-b171-bbb1dc9a8673" 
         alt = "Register Discount" /></td>
<tr>
</table>
