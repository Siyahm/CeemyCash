// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionModelAdapter extends TypeAdapter<TransactionModel> {
  @override
  final int typeId = 3;

  @override
  TransactionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionModel(
      transactionDate: fields[0] as DateTime,
      transactionAmount: fields[1] as double,
      transactionCategory: fields[2] as CategoryModel,
      type2: fields[4] as TransactionType,
    )..id = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, TransactionModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.transactionDate)
      ..writeByte(1)
      ..write(obj.transactionAmount)
      ..writeByte(2)
      ..write(obj.transactionCategory)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.type2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionTypeAdapter extends TypeAdapter<TransactionType> {
  @override
  final int typeId = 4;

  @override
  TransactionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TransactionType.incom;
      case 1:
        return TransactionType.exppense;
      default:
        return TransactionType.incom;
    }
  }

  @override
  void write(BinaryWriter writer, TransactionType obj) {
    switch (obj) {
      case TransactionType.incom:
        writer.writeByte(0);
        break;
      case TransactionType.exppense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
