import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

/// **Not: Bu şekilde 'Stete' durumunun işin içine girdiği durumlarda Widget kullanımının detaylı bilinmesi gerekiyor.
/// Özel oluşturulan 'Slider' içeren widget, birden fazla kere kullanıldığı için özel olarak oluşturuldu.
/// Özel widget'lar oluşturmaya 'Composition' deniliyor!
class CustomSliderContainerWidget extends StatefulWidget {
  final Color color;
  final Widget child;
  final Function sliderChanged; // Slider değişme olayı metodu.
  final String sliderText;
  final double sliderCountValue;
  final double sliderMinValue;
  final double sliderMaxValue;
  final int sliderDivisionsValue;

  CustomSliderContainerWidget(
      {this.color = Colors.white,
      this.child,
      this.sliderChanged,
      this.sliderCountValue = 0.0,
      this.sliderText,
      this.sliderMinValue = 0.0,
      this.sliderMaxValue = 1.0,
      this.sliderDivisionsValue = 10});

  @override
  _CustomSliderContainerWidgetState createState() =>
      _CustomSliderContainerWidgetState();
}

class _CustomSliderContainerWidgetState
    extends State<CustomSliderContainerWidget> {
  @override
  Widget build(BuildContext context) {
    // 'GestureDetector' widget'ı buton gibi davranması istenen widget'ları sarmalayarak kullanılır. Efektli geçişleri mevcuttur.
    return GestureDetector(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.sliderText, //'Kaç Gündür Tüttür içmisen?',
              style: my20SizeBoldBlackTextStyle,
            ),
            Text(
              '${widget.sliderCountValue.round()}',
              style: my23SizeBoldBlueTextStyle,
            ),
            Slider(
              value: widget.sliderCountValue,
              min: widget.sliderMinValue,
              max: widget.sliderMaxValue,
              divisions: widget.sliderDivisionsValue,
              label: '${widget.sliderCountValue.round()}',
              onChanged: widget.sliderChanged,
            )
          ],
        ),
        margin: EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
