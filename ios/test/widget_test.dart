import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:anchieta_flutter/main.dart'; // Ajuste o import para o seu arquivo

void main() {
  testWidgets('Fase 1: Adicionar campo de texto', (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());
    expect(find.byType(TextField), findsOneWidget, 
      reason: "Você precisa adicionar um widget do tipo TextField!");
  });

  testWidgets('Fase 2: Interagir com o Slider', (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());
    await tester.drag(find.byType(Slider), const Offset(100, 0));
    await tester.pump();
    expect(find.byType(Slider), findsOneWidget, 
      reason: "O Slider precisa existir e permitir interação.");
  });

  testWidgets('Fase 3: Seleção de RadioButtons', (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());
    await tester.tap(find.text('Retirada'));
    await tester.pump();
    expect(find.text('Retirada'), findsWidgets);
  });

  testWidgets('Fase 4: Checkbox de promoções', (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());
    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isTrue, 
      reason: "O Checkbox deve mudar para verdadeiro ao ser clicado.");
  });

  testWidgets('Fase 5: Exibir resultado na tela', (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());
    
    // Simula preenchimento completo
    await tester.enterText(find.byType(TextField), 'Produto X');
    await tester.tap(find.text('Cadastrar'));
    await tester.pump();

    // Valida se o resultado apareceu
    expect(find.textContaining('Produto X'), findsOneWidget, 
      reason: "O texto final não foi exibido na tela após clicar em Cadastrar!");
  });
}