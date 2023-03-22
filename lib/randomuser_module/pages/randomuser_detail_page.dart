import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/randomuser_model.dart';

class RandomUserDetailPage extends StatefulWidget {
  final Result item;

  RandomUserDetailPage(this.item);

  @override
  State<RandomUserDetailPage> createState() => _RandomUserDetailPageState();
}

class _RandomUserDetailPageState extends State<RandomUserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Detail Page"),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.topCenter,
      child: ListView(
        children: [
          _buildImage(),
          _buildName(),
          _buildPhone(),
          _buildEmail(),
          _buildAddress(),
          _buildLatLong(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Image.network(
      widget.item.picture!.large!,
      fit: BoxFit.cover,
    );
  }

  Widget _buildName() {
    return Card(
      child: ListTile(
        leading: Icon(Icons.account_circle),
        title: Text(
            "${widget.item.name!.title} ${widget.item.name!.first} ${widget.item.name!.last}"),
      ),
    );
  }

  Widget _buildPhone() {
    return Card(
      child: ListTile(
        leading: Icon(Icons.call),
        title: Text("${widget.item.cell}"),
        onTap: (){
          _openPhone(widget.item.cell!);
        },
      ),
    );
  }

  Widget _buildEmail() {
    return Card(
      child: ListTile(
        leading: Icon(Icons.email),
        title: Text("${widget.item.email}"),
        onTap: (){
          _openEmail(widget.item.email!);
        },
      ),
    );
  }

  Widget _buildAddress() {
    return Card(
      child: ListTile(
        leading: Icon(Icons.location_city),
        title: Text(
            "${widget.item.location!.street!.number!}, ${widget.item.location!.street!.name!}, ${widget.item.location!.city}, ${widget.item.location!.state}, ${widget.item.location!.country}"),
        onTap: (){
          _openGoogleSearch("${widget.item.location!.city}, ${widget.item.location!.state}, ${widget.item.location!.country}");
        },
      ),
    );
  }

  Widget _buildLatLong(){
    return Card(
      child: ListTile(
        leading: Icon(Icons.pin_drop),
        title: Text(
            "${widget.item.location!.coordinates!.latitude!}, ${widget.item.location!.coordinates!.longitude!}"),
        onTap: (){
          _openGoogleMap("${widget.item.location!.coordinates!.latitude!}", "${widget.item.location!.coordinates!.longitude!}");
        },
      ),
    );
  }

  _openGoogleMap(String lat, String long){
    try{
      launchUrl(Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$long"));
    } catch(e){
      throw Exception("Cannot launch a Google Maps");
    }
  }

  _openGoogleSearch(String query){
    try{
      launchUrl(Uri.parse("https://google.com/search?q=$query"));
    } catch(e){
      throw Exception("Cannot launch a browser");
    }
  }



  _openEmail(String email){
    try{
      launchUrl(Uri.parse("mailto:$email"));
    } catch(e){
      throw Exception("Cannot open email app");
    }
  }

  _openPhone(String tel){
    try{
      launchUrl(Uri.parse("tel:$tel"));
    } catch(e){
      throw Exception("Cannot open tel app");
    }
  }


}
