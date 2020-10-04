import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Özel oluşturulan widget, birden fazla kere kullanıldığı için özel olarak oluşturuldu.
/// Özel widget'lar oluşturmaya 'Composition' deniliyor!
class CustomContainerWidget extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onPress; // Tıklanma olayı metodu, metod dışarıdan verilecektir

  CustomContainerWidget({this.color = Colors.white, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    // 'GestureDetector' widget'ı buton gibi davranması istenen widget'ları sarmalayarak kullanılır. Efektli geçişleri mevcuttur.
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
