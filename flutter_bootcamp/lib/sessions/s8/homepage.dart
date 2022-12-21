import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String receivedData = "";
  var tfController = TextEditingController();
  String imageName = "baklava.png";
  bool switchControll = false;
  bool checkboxControll = false;
  int radioValue = 0;
  bool progressControll = false;
  double progress = 30.0;
  var tfHour = TextEditingController();
  var tfTime = TextEditingController();
  var countryList = <String>[];
  String selectedCountry = "Türkiye";
  var tfAlert = TextEditingController();

  @override
  void initState() {
    super.initState();
    countryList.add("Türkiye");
    countryList.add("Italya");
    countryList.add("Japonya");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets Usage"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(receivedData),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  controller: tfController,
                  decoration: const InputDecoration(hintText: "Data"),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    receivedData = tfController.text;
                  });
                },
                child: const Text("Try"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        imageName = "kofte.png";
                      });
                    },
                    child: const Text("Image 1"),
                  ),
                  // Image.asset("assets/images/$imageName"),
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: Image.network(
                      "http://kasimadalan.pe.hu/yemekler/resimler/$imageName",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        imageName = "ayran.png";
                      });
                    },
                    child: const Text("Image 2"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: SwitchListTile(
                        title: const Text("Dart"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: switchControll,
                        onChanged: (receivedData) {
                          setState(() {
                            switchControll = receivedData;
                          });
                        }),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: CheckboxListTile(
                        title: const Text("Flutter"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: checkboxControll,
                        onChanged: (receivedData) {
                          setState(() {
                            checkboxControll = receivedData!;
                          });
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: RadioListTile(
                      title: const Text("Barcelona"),
                      value: 1,
                      groupValue: radioValue,
                      onChanged: (receivedData) {
                        setState(() {
                          radioValue = receivedData!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: RadioListTile(
                      title: const Text("Real Madrid"),
                      value: 2,
                      groupValue: radioValue,
                      onChanged: (receivedData) {
                        setState(() {
                          radioValue = receivedData!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        progressControll = true;
                      });
                    },
                    child: const Text("Basla"),
                  ),
                  Visibility(
                    visible: progressControll,
                    child: const CircularProgressIndicator(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        progressControll = false;
                      });
                    },
                    child: const Text("Dur"),
                  ),
                ],
              ),
              // Text(progress.toString()),
              Text(progress.toInt().toString()),
              Slider(
                  min: 0.0,
                  max: 100.0,
                  value: progress,
                  onChanged: (receivedData) {
                    setState(() {
                      progress = receivedData;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: tfController,
                      decoration: const InputDecoration(hintText: "Saat"),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showTimePicker(
                              context: context,
                              initialTime:
                                  TimeOfDay.fromDateTime(DateTime.now()))
                          .then((value) {
                        tfHour.text = "${value!.hour}:${value.minute}";
                      });
                    },
                    icon: const Icon(Icons.access_time),
                  ),
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: tfController,
                      decoration: const InputDecoration(hintText: "Saat"),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2010),
                        lastDate: DateTime(2030),
                      ).then((value) {
                        tfTime.text =
                            "${value!.day}/${value.month}/${value.year}";
                      });
                    },
                    icon: const Icon(Icons.date_range),
                  ),
                ],
              ),
              DropdownButton(
                  value: selectedCountry,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: countryList.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (receivedData) {
                    setState(() {
                      selectedCountry = receivedData!;
                    });
                  }),
              GestureDetector(
                onTap: (() {
                  print("Tek tik");
                }),
                onDoubleTap: () {
                  print("Cift tik");
                },
                onLongPress: () {
                  print("Uzun basildi");
                },
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("Silmek istiyor musunuz?"),
                          action: SnackBarAction(
                              label: "Evet",
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Silindi!")));
                              }),
                        ),
                      );
                    },
                    child: const Text("Snackbar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.white,
                          content: const Text(
                            "İnternet bağlantısı yok",
                            style: TextStyle(color: Colors.indigoAccent),
                          ),
                          action: SnackBarAction(
                              label: "Tekrar dene",
                              textColor: Colors.red,
                              onPressed: () {}),
                        ),
                      );
                    },
                    child: const Text("Snackbar(ö)"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Baslik"),
                              content: const Text("data"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Tamam secildi!")));
                                  },
                                  child: const Text("Tamam"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Iptal secildi!")));
                                  },
                                  child: const Text("Iptal"),
                                ),
                              ],
                            );
                          });
                    },
                    child: const Text("Alert"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.grey,
                              title: const Text("Kayit Islemi"),
                              content: TextField(
                                controller: tfAlert,
                                decoration:
                                    const InputDecoration(hintText: "Veri"),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Alinan veri : ${tfAlert.text}")));
                                  },
                                  child: const Text(
                                    "Kaydet",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Iptal secildi!")));
                                  },
                                  child: const Text(
                                    "Iptal",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: const Text("Alert(ö)"),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  print("Switch durum: $switchControll");
                  print("Checkbox durum: $checkboxControll");
                  print("RadioButton durum: $radioValue");
                  print("Slider durum: $progress");
                  print("Secilen ulke: $selectedCountry");
                },
                child: const Text("Goster"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
