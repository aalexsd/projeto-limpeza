import 'package:clean_project/data/task_inherited.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext,}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value){
    if(value != null && value.isEmpty){
      return true;
    }
    return false;
  }

  bool quantityValidator(String? value){
    if(value != null && value.isEmpty){
      if (int.parse(value) > 7 ||
          int.parse(value) < 1){
        return true;
      }
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[100],
          title: const Text('Nova Tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
                height: 650,
                width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black12,
                    border: Border.all(width: 1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (valueValidator(value)) {
                            return 'Insira o nome da tarefa';
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Tarefa',
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (valueValidator(value)) {
                            return 'Insira um URL de imagem.';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.url,
                        onChanged: (text) {
                          setState(() {});
                        },
                        controller: imageController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Imagem',
                            fillColor: Colors.white70,
                            filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (quantityValidator(value)) {
                            return 'Insira uma quantidade entre 1 e 7.';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: quantityController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Quantidade por semana',
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          imageController.text,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stacktrace) {
                            return Image.asset('assets/images/nophoto.png');
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          TaskInherited.of(widget.taskContext).newTask(
                            nameController.text,
                            imageController.text,
                            int.parse(quantityController.text),);
                        ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(
                        'Tarefa salva com sucesso.'),
                        ),
                        );
                        Navigator.pop(context);
                      }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[100],
                      ),
                      child: const Text('Adicionar'),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
