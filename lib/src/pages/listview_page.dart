import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  //control de scroll
  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = new List();
  int _lastItem = 0;

  //
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _add10();

      //a la escucha de todos los cambios
    _scrollController.addListener(() {
      //para ver el final de la pagina
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _add10();

        fectchData();
      }
    });
  }


  //cuando la pagina es destruida
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Stack(children: [
        _createdList(),
        _createdLoading(),
      ],)
    );
  }

  Widget _createdList() {
    return RefreshIndicator(
        onRefresh: getPage1,

        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _listNumbers[index];

          //para el loading
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            height: 250.0, // static height
            fit: BoxFit.cover, //se ajuste al contr
          );
        },
      ),
    );
  }

  Future<Null> getPage1() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){

      _listNumbers.clear(); //
      _lastItem++;
      _add10();
    });

    return Future.delayed(duration);
  }

  void _add10() {
    for (var i = 0; i < 10; i++) {
      _lastItem++;
      _listNumbers.add(_lastItem);

      setState(() {});
    }
  }

  Future<Null> fectchData() async {
    _isLoading = true;
    setState(() {
      
    });

    final duration = new Duration(seconds: 2);
    // SIN () para que no se ejecute en ese instante
    return new Timer(duration, requestHTTP);
  }

  void requestHTTP(){
    _isLoading = false;

    _scrollController.animateTo(
      //mueve el scroll un poco mas arriba
      _scrollController.position.pixels +  100, 
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
      );

    _add10();
  }

  Widget _createdLoading() {
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end, //inferior
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator()
            ],

          ),
          SizedBox(height: 10.0,)
        ],
      );
    }else{
      return Container();
    }
  }
}
