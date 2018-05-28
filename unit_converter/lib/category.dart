import 'package:flutter/material.dart';
import 'package:unit_converter/unit.dart';
import 'package:unit_converter/converter_route.dart';


class Category extends StatelessWidget{
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;
  const Category({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
    @required this.units,
  }): assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null),
        super(key: key);

  void _navigateToConverter(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              name,
              style: Theme.of(context).textTheme.display1,
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: ConverterRoute(
            color: color,
            name: name,
            units: units,
          ),
        );
      },
    ));  }
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Material(
        color: Colors.transparent,
        child: Container(
          height: 100.0,
          padding: const EdgeInsets.all(8.0),
          child: new InkWell(
            borderRadius: BorderRadius.circular(50.0),
            splashColor: color,
            onTap: ()=>_navigateToConverter(context),
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Center(
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: new Icon(iconLocation,size: 60.0,),
                    ),
                    new Center(child: new Text(name,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline,)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}