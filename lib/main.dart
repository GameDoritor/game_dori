import 'package:flutter/material.dart';
import 'henry_some_one.dart';

void main() {
  runApp(const MyApp());

  
}

// 플러터 기본 문법 공부
class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    // 메인 페이지 호출
    return MaterialApp(
      home: Center(child: Container( width: 50, height: 50, color: Colors.blue),)
    );
    
  }
}

// 애니메이션 구현
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SomeOneGameApp(),
    );
  }
}

class SomeOneGameApp extends StatelessWidget {
  const SomeOneGameApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HenrySomeOneGame(),
    );
  }
}