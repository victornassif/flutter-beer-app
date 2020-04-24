import 'package:beer_app/models/cerveja.model.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final Cerveja cerveja;

  DetailsView({this.cerveja});

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0),
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/beer.gif'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                padding: EdgeInsets.all(40.0),
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(color: Color.fromRGBO(58, 66, 86, .3)),
              ),
              Positioned(
                child: AppBar(
                  elevation: 150,
                  backgroundColor: Colors.transparent,
                  leading: FlatButton(
                    child: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).accentColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Positioned(
                left: 80,
                bottom: 70,
                child: Container(
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: NetworkImage(cerveja.imagemUrl),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/beer_mug.png'),
                    ),
                  ),
                ),
                Text(
                  this.cerveja.nome,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 60,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/beer.png'),
                    ),
                  ),
                ),
                Text(
                  this.cerveja.alcool.toString() + '% Álcool',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:  FontWeight.bold,
                  ),
                ),
                Container(
                  width: 60,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/offer.png'),
                    ),
                  ),
                ),
                Text(
                  this.cerveja.precoStr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:  FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return scaffold;
  }
}
