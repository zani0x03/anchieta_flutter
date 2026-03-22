**Instruções**
Nesta atividade, você aplicará seus conhecimentos de Flutter para construir uma interface funcional baseada em testes automatizados. O objetivo é que você desenvolva a lógica e a UI de um formulário de cadastro, garantindo que todos os requisitos sejam atendidos conforme descrito nos testes.

**1. Preparação do Repositório**
Para começar, você deve configurar o ambiente de trabalho:

Fork: Acesse o repositório anchieta_flutter e realize um Fork para a sua conta pessoal.

Clone: Clone o seu fork para sua máquina local.

Dependências: No terminal do projeto, execute flutter pub get para baixar os pacotes necessários.

**2. O Desafio**
Seu objetivo é implementar os componentes no arquivo lib/main.dart (ou nos arquivos de componentes que você criar) para que a interface se comporte exatamente como o esperado pelos testes.

Onde estão os testes? No arquivo test/widget_test.dart. Eles simulam cliques, entradas de texto e verificam se as mensagens corretas aparecem na tela.

O que implementar?

Um campo de texto para o nome do produto.

Um Slider para definir a quantidade.

Radio buttons para o tipo de entrega (Carreto, Retirada, Correio).

Um Dropdown para escolha da região.

Um Checkbox para aceite de termos/e-mail.

Um botão "Cadastrar" que, ao ser clicado, exibe um resumo dos dados abaixo.

**3. Executando os Testes**
Diferente do Dart puro, no Flutter usamos o comando:

flutter test


Dica: Leia atentamente as mensagens de erro no terminal. Elas dirão exatamente qual widget está faltando ou qual valor não está sendo exibido corretamente. O desafio termina quando todos os testes estiverem "verdes".

4. Entrega via Pull Request (PR)
Realize o git commit e git push para o seu repositório.

No GitHub, abra um Pull Request do seu fork para o repositório original.

Importante: Copie o link do seu Pull Request e envie-o no AVA para formalizar a entrega.

**⚠️ Regras de Integridade e Uso de IA**
Este exercício é focado no desenvolvimento do seu raciocínio lógico e domínio da árvore de Widgets do Flutter.

Proibição de IA: É estritamente proibido o uso de ferramentas de IA (ChatGPT, GitHub Copilot, Gemini, etc.) para gerar as soluções.

Monitoramento: O código será submetido a análise. Caso seja detectado plágio ou uso de IA, a atividade será zerada.

Propósito: O foco é aprender a debugar e construir interfaces robustas. O erro no teste é seu melhor professor; utilize-o para entender o que o Flutter espera de você.

Dicas Extras:
Lembre-se de gerenciar o estado dos Widgets (utilize StatefulWidget onde for necessário capturar a mudança de valores como o Slider ou o Checkbox).

Fique atento aos nomes e labels dos componentes; os testes geralmente procuram por textos específicos na tela.

