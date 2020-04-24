import 'package:beer_app/models/cerveja.model.dart';
import 'package:beer_app/repository/cerveja.repository.dart';
import 'package:flutter/material.dart';

import 'details.view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Cervejas",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor),
        ),
      ),
      body: FutureBuilder(
        future: CervejaRepository().parseCervejas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            );
          }
        },
      ),
    );
  }

  ListView buildListView(List<Cerveja> cervejas) {
    return ListView.builder(
      itemCount: cervejas == null ? 0 : cervejas.length,
      itemBuilder: (BuildContext ctx, int index) {
        return cardCerveja(cervejas[index]);
      },
    );
  }

  Card cardCerveja(Cerveja cerveja) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(48),
              image: DecorationImage(image: NetworkImage(cerveja.imagemUrl)),
            ),
          ),
          title: Text(
            cerveja.nome,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward,
            color: Theme.of(context).accentColor,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsView(
                    cerveja: cerveja,
                  ),
                ));
          },
        ),
      ),
    );
  }
}
