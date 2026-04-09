# Atividade Flutter - Cadastro de Produto

- **Nome:** ISAIAS NERI DA CONCEICAO JUNIOR  
- **RA:** 2405536

## Resumo do que foi feito
- Estruturei o app com `MaterialApp` + `MyHomePage` (`StatefulWidget`).
- Criei estados para: nome, quantidade, tipo de entrega, região, aceite e resumo.
- Adicionei os componentes pedidos:
  - `TextField` (nome do produto)
  - `Slider` (quantidade)
  - `RadioListTile` (Carreto, Retirada, Correio)
  - `DropdownButtonFormField` (região)
  - `CheckboxListTile` (aceite)
  - Botão `Cadastrar`
- Implementei `_cadastrar()` para montar e exibir o resumo na tela.
- Adicionei `dispose()` no controller.

## Observação sobre a pegadinha do teste
No **Teste 5**, a validação com `find.textContaining('Produto X')` pode falhar mesmo com a lógica correta, porque o texto pode aparecer em mais de um lugar ao mesmo tempo:
1. no `TextField` (entrada do usuário);
2. no resumo exibido após clicar em `Cadastrar`.


## Execução
```bash
flutter pub get
flutter run
```

## Testes
```bash
flutter test
flutter test test/widget_test.dart
```