import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _createdSlider(),
            _createdCheckbox(),
            _createdSwitch(),
            Expanded(child: _createdImage()),
          ],
        ),
      ),
    );
  }

  Widget _createdSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'size image',
      // divisions: 20,
      value: _valueSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_blockCheck)
          ? null
          : (valor) {
              setState(() {
                _valueSlider = valor;
              });
            },
    );
  }

  Widget _createdImage() {
    return Container(
      child: Image(
        image: NetworkImage(
            'https://www.pngitem.com/pimgs/m/198-1988794_mikasa-png-transparent-png.png'),
        width: _valueSlider,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _createdCheckbox() {
    // return Checkbox(
    //   value: _blockCheck,
    //   onChanged: (v){
    //     setState(() {
    //       _blockCheck = v;
    //     });
    //   },
    // );

      return CheckboxListTile(
        value: _blockCheck,
        title: Text('Block Slider'),
        onChanged: (v) {
          setState(() {
            _blockCheck = v;
          });
        });
  }

  Widget _createdSwitch() {
    return SwitchListTile(
      value: _blockCheck,
        title: Text('Block Slider'),
        onChanged: (v) {
          setState(() {
            _blockCheck = v;
          });
        }
    ) ;
  }

}
