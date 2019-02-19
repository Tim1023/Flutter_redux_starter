import 'package:flutter/material.dart';
import 'package:onigiri_app/modules/discovery/models/article_list.dart';

class Articles extends StatefulWidget {
  final ArticleList articles;

  final VoidCallback fetchArticles;

  const Articles({Key key, this.articles, this.fetchArticles}): super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {

  initState() {
    if(widget.articles == null){
      widget.fetchArticles();
    }else{
      print("sadasdsad*******************"+widget.articles.articles.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    print("2132132132132131232133"+context.toString());
    return Center(
      child: Text(widget.articles.articles[0].title),
    );
  }
}
