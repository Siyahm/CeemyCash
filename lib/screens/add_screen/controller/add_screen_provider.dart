import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/db_functions/category/category_db.dart';
import 'package:my_wallet/db_functions/transactions/transaction_db.dart';
import 'package:my_wallet/screens/add_screen/model/transaction_model.dart';
import 'package:my_wallet/screens/add_screen/view/add_transaction.dart';
import 'package:my_wallet/screens/add_screen/view/widgets/income_added_alertbox.dart';
import 'package:my_wallet/screens/categories_screen/models/category_model.dart';
import 'package:my_wallet/screens/categories_screen/view/categories.dart';

enum ScreenAction {
  addScreen,
  editScreen,
}

enum ScreenType {
  incmeScreen,
  expenseScreen,
}

class AddScreenProvider with ChangeNotifier {
  final transactionAmountEditingController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  DateTime? selectedDate;

  String? selectincomeCategory;
  CategoryModel? selectedCategory;

  TransactionModel? transactionModel;

  final formKey1 = GlobalKey<FormState>();

  ScreenAction? type;
  ScreenType? screenType;

  // String? amountType;
  // String? dropDownValue;

  CategoryModel? categoryModel;

  // final formKey1 = GlobalKey<FormState>();

  // DateTime date = DateTime.now();

  void editIncomeValueAssign(
    // String? amountType,
    // String? dropDownValue,
    ScreenAction type,
    TransactionModel transactionModel,
  ) async {
    await CategoryDB.instance.refreshUI();
    if (type == ScreenAction.editScreen) {
      transactionAmountEditingController.text =
          transactionModel.transactionAmount.toString();
      dateController.text =
          DateFormat('yMMMMd').format(transactionModel.transactionDate);
      // date = widget.transactionModel!.transactionDate;

    }
    notifyListeners();
  }

  Future<void> showDate(context) async {
    final DateTime? result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (result != null) {
      selectedDate = result;
    }
    notifyListeners();
  }

  void calenderIconOnTap() {
    if (selectedDate != null) {
      dateController.text = DateFormat('yMMMMd').format(selectedDate!);
      notifyListeners();
    }
  }

  void incomeCategoryOnChange(String? choosedCategory) {
    selectincomeCategory = choosedCategory;
    notifyListeners();
  }

  void categoryOnChange(CategoryModel choosedCategory) {
    selectedCategory = choosedCategory;
    notifyListeners();
  }

  String? changeCategoryValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please choose a category';
    } else {
      return null;
    }
  }

  void addNewCategoryButtonPressed(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ScreenCategories(),
      ),
    );
  }

  String? amountValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter amount';
    } else {
      return null;
    }
  }

  void popFunction(context) {
    Navigator.of(context).pop();
  }

  void incomeAddSaveButtonPressed(
    context,
    ScreenAction type,
    ScreenType screenType,
    TransactionModel? transactionModel,
  ) {
    if (formKey1.currentState!.validate()) {
      addOrEditTransaction(type, screenType, transactionModel);
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) => IncomeAddedAlertBox(
          onPressed: () {
            incomeAddedAlertBoxButtonsPressed(context, screenType);
          },
          text: screenType == ScreenType.incmeScreen
              ? 'Income has been\nadded successfully'
              : 'Expense has been\nadded successfully',
        ),
      );
    }
  }

  void incomeAddedAlertBoxButtonsPressed(context, ScreenType screenType) {
    // if (screenType == ScreenType.incmeScreen) {
    clearAddScreenValues();
    // TransactionDB.instance.refreshUI();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => AddTransaction(
          screenType: __addTransactionPageTypeCheck(screenType),
          type: ScreenAction.addScreen,
        ),
      ),
    );
    notifyListeners();
  }

  ScreenType __addTransactionPageTypeCheck(ScreenType screenType) {
    ScreenType addScreenType = screenType == ScreenType.incmeScreen
        ? ScreenType.incmeScreen
        : ScreenType.expenseScreen;
    return addScreenType;
  }

  void _addTransaction(
    ScreenType screenType,
    TransactionModel? transactionModel,
  ) async {
    final transactionAmount = transactionAmountEditingController.text;

    if (transactionAmount.isEmpty) {
      return;
    } else if (selectincomeCategory == null) {
      return;
    }

    final parcedAmount = double.tryParse(transactionAmount);
    if (parcedAmount == null) {
      return;
    } else if (selectedCategory == null) {
      return;
    }

    final transactionModel = TransactionModel(
      transactionDate: selectedDate!,
      transactionAmount: parcedAmount,
      transactionCategory: selectedCategory!,
      type2: screenType == ScreenType.incmeScreen
          ? TransactionType.incom
          : TransactionType.exppense,
    );
    await TransactionDB.instance.addTransaction(transactionModel);
  }

  void _editTransaction(
    ScreenType screenType,
    TransactionModel? transactionModel,
  ) async {
    final transactionAmount = transactionAmountEditingController.text;

    if (selectedCategory == null) {
      return null;
    }

    final parcedAmount = double.tryParse(transactionAmount);

    final editedTransactionModel = TransactionModel(
      transactionDate: transactionModel!.transactionDate,
      transactionAmount: parcedAmount!,
      transactionCategory: selectedCategory!,
      type2: screenType == ScreenType.incmeScreen
          ? TransactionType.incom
          : TransactionType.exppense,
    );
    await transactionModel.editTransaction(editedTransactionModel);
    clearAddScreenValues();
    // TransactionDB.instance.refreshUI();
    notifyListeners();
  }

  void addOrEditTransaction(ScreenAction type, ScreenType screenType,
      TransactionModel? transactionModel) async {
    type == ScreenAction.addScreen
        ? _addTransaction(screenType, transactionModel)
        : _editTransaction(screenType, transactionModel);
  }

  String screenTypeValidator(ScreenAction actiontype, ScreenType screenType) {
    if (actiontype == ScreenAction.addScreen &&
        screenType == ScreenType.incmeScreen) {
      return 'Add Income';
    } else if (actiontype == ScreenAction.addScreen &&
        screenType == ScreenType.expenseScreen) {
      return 'Add Expense';
    } else {
      return 'Edit Transaction';
    }
  }

  void clearAddScreenValues() {
    transactionAmountEditingController.clear();
    dateController.clear();
    selectincomeCategory = null;
  }

  String? dateControllValidator(value) {
    if (value == '' || value == null) {
      return 'Date cannot be empty';
    }
    return null;
  }

  List<DropdownMenuItem<String>>? categoryFieldListItems(
    ScreenType screenType,
    List<CategoryModel> incomeCatergoryModelList,
    List<CategoryModel> expenseCategoryModelList,
  ) {
    final transactionCategoryList = (screenType == ScreenType.incmeScreen
            ? incomeCatergoryModelList
            : expenseCategoryModelList)
        .map((e) {
      return DropdownMenuItem(
        value: e.id,
        child: Text(e.name),
        onTap: () {
          categoryOnChange(e);
          // selectedCategory = e;
        },
      );
    }).toList();

    return transactionCategoryList;
  }

  String expenseIncomeTextvalidator(ScreenType screenType) {
    String text = screenType == ScreenType.incmeScreen ? 'Income' : 'Expense';
    return text;
  }

  Color textColor(ScreenType screenType) {
    final textColor =
        screenType == ScreenType.incmeScreen ? Colors.green : Colors.red;
    return textColor;
  }
}
