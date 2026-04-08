import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ATENÇÃO: Verifique se o nome do pacote abaixo está correto de acordo com seu projeto
import 'package:anchieta_flutter/main.dart'; 

void main() {
  testWidgets('Fase 1: Adicionar campo de texto', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('Fase 2: Interagir com o Slider', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.drag(find.byType(Slider), const Offset(100, 0));
    await tester.pump();
    expect(find.byType(Slider), findsOneWidget);
  });

  testWidgets('Fase 3: Seleção de RadioButtons', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Retirada'));
    await tester.pump();
    expect(find.text('Retirada'), findsWidgets);
  });

  testWidgets('Fase 4: Checkbox de promoções', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isTrue);
  });

  testWidgets('Fase 5: Exibir resultado na tela', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    
    await tester.enterText(find.byType(TextField), 'Produto X');
    await tester.tap(find.text('Cadastrar'));
    await tester.pump();

    expect(find.textContaining('Produto X'), findsOneWidget);
  });
}