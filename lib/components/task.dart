import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int quantidade;
  Task(this.nome, this.foto, this.quantidade, {Key? key})
      : super(key: key);

  int nivel = 0;
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {


  bool assetOrNetwork(){
    if(widget.foto.contains('http')){
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.pink[100],
            ),
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white
            ),
          ),
          Column(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey,
                      ),
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: assetOrNetwork() ? Image.asset(
                            widget.foto,
                        fit: BoxFit.cover
                        ) : Image.network
                          (widget.foto,
                        fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis
                            ),
                          ),
                        ),
                        Text(
                          'Necessário: ${widget.quantidade}'
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 62,
                      height: 62,
                      child: ElevatedButton(onPressed:(){
                        setState(() {
                          widget.nivel++;
                        });
                      },
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[100],
                            shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10)),
                        child: const Text('Limpeeeeeei',
                          style: TextStyle(fontSize: 13)),
                        ),
                    ),
                    ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: ((widget.quantidade > 0)
                           ? (widget.nivel/widget.quantidade)
                        :1
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Feito: ${widget.nivel}',
                    style: const TextStyle(fontSize: 15,
                    color: Colors.white),),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
