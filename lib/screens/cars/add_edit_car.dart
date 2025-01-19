import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pitstop/models/car.dart';
import 'package:pitstop/services/car.service.dart';

class AddEditCarPage extends StatefulWidget {
  final Car? car;

  const AddEditCarPage({super.key, this.car});

  @override
  State<AddEditCarPage> createState() => _AddEditCarPageState();
}

class _AddEditCarPageState extends State<AddEditCarPage> {
  final _formKey = GlobalKey<FormState>();
  final _carService = CarService();
  
  late TextEditingController _vinController;
  late TextEditingController _licensePlateController;
  late TextEditingController _brandController;
  late TextEditingController _modelController;
  late TextEditingController _yearController;

  DateTime? _itpExpiry;
  DateTime? _rcaExpiry;
  DateTime? _rovinietaExpiry;

  late TextEditingController _itpExpiryController;
  late TextEditingController _rcaExpiryController;
  late TextEditingController _rovinietaExpiryController;

  @override
  void initState() {
    super.initState();
    _vinController = TextEditingController(text: widget.car?.vin);
    _licensePlateController = TextEditingController(text: widget.car?.licensePlate);
    _brandController = TextEditingController(text: widget.car?.brand);
    _modelController = TextEditingController(text: widget.car?.model);

    _itpExpiry = widget.car?.itpExpiry;
    _rcaExpiry = widget.car?.rcaExpiry;
    _rovinietaExpiry = widget.car?.rovinietaExpiry;
    
    _yearController = TextEditingController(
      text: widget.car?.year?.toString(),
    );
    _itpExpiryController = TextEditingController(
      text: widget.car?.itpExpiry.toString().split(' ')[0]
    );
    _rcaExpiryController = TextEditingController(
      text: widget.car?.rcaExpiry.toString().split(' ')[0]
    );
    _rovinietaExpiryController = TextEditingController(
      text: widget.car?.rovinietaExpiry.toString().split(' ')[0]
    );
  }

  @override
  void dispose() {
    _vinController.dispose();
    _licensePlateController.dispose();
    _brandController.dispose();
    _modelController.dispose();
    _yearController.dispose();
    _itpExpiryController.dispose();
    _rcaExpiryController.dispose();
    _rovinietaExpiryController.dispose();
    super.dispose();
  }

  Future<void> _saveCar() async {
    if (!_formKey.currentState!.validate()) return;
    
    final car = Car(
      id: widget.car?.id,
      userId: FirebaseAuth.instance.currentUser!.uid,
      vin: _vinController.text,
      licensePlate: _licensePlateController.text,
      itpExpiry: _itpExpiry!,
      rcaExpiry: _rcaExpiry!,
      rovinietaExpiry: _rovinietaExpiry!,
      brand: _brandController.text,
      model: _modelController.text,
      year: int.tryParse(_yearController.text),
    );

    print(car.toMap());

    try {
      if (widget.car == null) {
        await _carService.addCar(car);
      } else {
        await _carService.updateCar(widget.car!.id!, car);
      }
      
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('A apărut o eroare!'),
        ),
      );
    }
  }

   Widget _buildDateField({
    required String label,
    required TextEditingController controller,
    required void Function(DateTime) onDateSelected,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.calendar_today),
        border: const OutlineInputBorder(),
      ),
      onTap: () => _selectDate(context, controller, onDateSelected),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Acest câmp este obligatoriu';
        }

        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),      
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _vinController,
                decoration: const InputDecoration(
                  labelText: 'VIN',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Acest camp este obligatoriu';
                  }

                  if(value.length != 17) {
                    return 'VIN-ul trebuie sa aiba 17 caractere';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _licensePlateController,
                decoration: const InputDecoration(
                  labelText: 'Numar de inmatriculare',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Acest camp este obligatoriu';
                  }

                  if(value.length < 6) {
                    return 'Numarul de inmatriculare trebuie sa aiba cel putin 6 caractere';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _brandController,
                decoration: const InputDecoration(
                  labelText: 'Marca',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Acest camp este obligatoriu';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _modelController,
                decoration: const InputDecoration(
                  labelText: 'Model',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Acest camp este obligatoriu';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _yearController,
                decoration: const InputDecoration(
                  labelText: 'Anul de fabricatie',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Acest camp este obligatoriu';
                  }

                  if(int.tryParse(value) == null) {
                    return 'Anul de fabricatie trebuie sa fie un numar';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildDateField(
                label: 'Expirare ITP',
                controller: _itpExpiryController,
                onDateSelected: (date) {
                  setState(() => _itpExpiry = date);
                },
              ),
              const SizedBox(height: 16),
              _buildDateField(
                label: 'Expirare RCA',
                controller: _rcaExpiryController,
                onDateSelected: (date) {
                  setState(() => _rcaExpiry = date);
                },
              ),
              const SizedBox(height: 16),
              _buildDateField(
                label: 'Expirare Rovinieta',
                controller: _rovinietaExpiryController,
                onDateSelected: (date) {
                  setState(() => _rovinietaExpiry = date);
                },
              ),
              const SizedBox(height: 16),
              
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                onPressed: _saveCar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).cardColor,
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.onSurface,
                    width: 1,
                  ),
                ),
                child: Text(
                  widget.car == null ? 'Adauga autovehicul' : 'Salveaza modificarile',
                ),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller, void Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.tryParse(controller.text) ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        controller.text = picked.toString().split(' ')[0];
        onDateSelected(picked);
      });
    }
  }
}