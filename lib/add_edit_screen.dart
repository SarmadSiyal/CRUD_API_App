import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item_model.dart';
import 'item_view_model.dart';
import 'custom_widgets.dart';

class AddEditScreen extends StatefulWidget {
  final bool isEdit;
  final Item? item;

  const AddEditScreen({super.key, required this.isEdit, this.item});

  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.item != null) {
      titleController.text = widget.item!.title;
      descController.text = widget.item!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ItemViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? 'Edit Item' : 'Add New Item'),
        backgroundColor: Color(0xFFD3C6F1),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE1DFF7),
              Color(0xFFD3C6F1),
              Color(0xFFB2A4F4),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(children: [
              CustomTextField(
                label: 'Title',
                controller: titleController,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Description',
                controller: descController,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: widget.isEdit ? 'Update' : 'Add',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newItem = Item(
                      id: widget.item?.id ?? '',
                      title: titleController.text,
                      description: descController.text,
                    );
                    if (widget.isEdit) {
                      await viewModel.updateItem(newItem.id, newItem);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Item updated")),
                      );
                    } else {
                      await viewModel.addItem(newItem);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Item added")),
                      );
                    }
                    Navigator.pop(context);
                  }
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
