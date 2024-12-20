import 'package:flutter/material.dart';
import 'service_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Service Provider App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedType = "Any";
  String? selectedProfession;
  ServiceProvider? selectedProvider;
  List<ServiceProvider> selectedProviders = providers;

  void selectProviders() {
    setState(() {
      selectedProviders = providers.where((provider) {
        bool matchesType = (selectedType == "Any") ||
            (selectedType == "Individual" && provider.isIndividual) ||
            (selectedType == "Company" && !provider.isIndividual);
        bool matchesProfession = selectedProfession == null ||
            provider.profession == selectedProfession;
        return matchesType && matchesProfession;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Service Providers"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black),
      body: Center(
          child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Individual", style: TextStyle(fontSize: 18.0)),
            Radio(
                value: "Individual",
                groupValue: selectedType,
                onChanged: (val) {
                  setState(() {
                    selectedType = val!;
                    selectProviders();
                  });
                }),
            const Text("Company", style: TextStyle(fontSize: 18.0)),
            Radio(
                value: "Company",
                groupValue: selectedType,
                onChanged: (val) {
                  setState(() {
                    selectedType = val!;
                    selectProviders();
                  });
                }),
            const Text("Any", style: TextStyle(fontSize: 18.0)),
            Radio(
                value: "Any",
                groupValue: selectedType,
                onChanged: (val) {
                  setState(() {
                    selectedType = val!;
                    selectProviders();
                  });
                }),
          ],
        ),
        const SizedBox(height: 20),
        DropdownButton<String>(
          value: selectedProfession,
          hint: const Text("Select a Profession"),
          onChanged: (value) {
            setState(() {
              selectedProfession = value;
              selectProviders();
            });
          },
          items: providers
              .map((provider) => provider.profession)
              .toSet()
              .map((profession) => DropdownMenuItem<String>(
                    value: profession,
                    child: Text(profession),
                  ))
              .toList(),
        ),
        const SizedBox(height: 20),
        DropdownButton<ServiceProvider>(
          value: selectedProvider,
          hint: const Text("Select a provider"),
          onChanged: (value) {
            setState(() {
              selectedProvider = value;
            });
          },
          items: selectedProviders
              .map((provider) => DropdownMenuItem<ServiceProvider>(
                    value: provider,
                    child: Text(provider.name),
                  ))
              .toList(),
        ),
        const SizedBox(height: 20),
        if (selectedProvider != null)
          Text(
            selectedProvider.toString(),
            style: const TextStyle(fontSize: 16.0),
          ),
      ])),
    );
  }
}
