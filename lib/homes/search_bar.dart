import 'package:flutter/material.dart';

typedef OnSearchText = Function(String text);
typedef OnToggleSwitch = Function(bool on);

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final OnSearchText onSearchText;
  final OnToggleSwitch onToggleVeg;
  final bool isVegOn;
  const SearchBar({Key? key, required this.isVegOn, required this.onSearchText, required this.onToggleVeg})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Widget _buildTextField() {
    return TextField(
      decoration: const InputDecoration(hintText: "Enter dish name"),
      controller: _textController,
    );
  }

  Widget _buildSwitch() {
    return Row(
      children: [
        const Text("I'm vegetarian"),
        Switch(value: widget.isVegOn, onChanged: widget.onToggleVeg,)
      ],
    );
  }
  
  Widget _buildSubmitButton() {
    return TextButton(
      child: const Text("Search", style: TextStyle(color: Colors.purple),),
      style: TextButton.styleFrom(elevation: 8.0, backgroundColor: Colors.green,),
      onPressed: () {
        widget.onSearchText(_textController.text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Flexible(
            child: _buildTextField()
          ),
          _buildSwitch(),
          _buildSubmitButton(),
        ],
      ),
      backgroundColor: Colors.lightGreen,
    );
  }
}

