import 'dart:async';

import 'package:drklepson_utility_package/drklepson_utility_package.dart';
import 'package:flutter/material.dart';
import 'package:turkish/turkish.dart';

class GenericAutoCompDrop<T extends Object> extends StatelessWidget {
  GenericAutoCompDrop({
    required this.onSelected,
    required this.itemView,
    required this.items,
    required this.toStringMethod,
    required this.labelText,
    super.key,
    this.onClearPressed,
    this.errorText = 'Geçerli Bir Seçim Yapınız.',
    this.listWidth,
    this.controller,
  });

  final void Function(T item) onSelected;
  final Iterable<T> items;
  final String Function(T item) toStringMethod;
  final void Function()? onClearPressed;
  final Widget Function(T) itemView;
  final String errorText;
  final double? listWidth;
  final String labelText;
  final TextEditingController? controller;

  FutureOr<Iterable<T>> optionsBuilder(
    TextEditingValue value,
    Iterable<T> kadroList,
  ) {
    return value.text.isEmpty
        ? items
        : items.where(
            (element) => turkish
                .toUpperCase(toStringMethod.call(element))
                .contains(turkish.toUpperCase(value.text)),
          );
  }

  String? validator(String? value) {
    final valid = items.any((element) => toStringMethod.call(element) == value);
    if (valid) onEditingComplete(value);
    return valid ? null : errorText;
  }

  final GlobalKey<State> fieldviewkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Autocomplete<T>(
      optionsBuilder: (value) => optionsBuilder(value, items),
      onSelected: onSelected.call,
      displayStringForOption: toStringMethod.call,
      fieldViewBuilder: (_, localController, node, __) {
        return OptionFieldView(
          key: fieldviewkey,
          controller: localController,
          node: node,
          validator: validator,
          onClearPressed: onClearPressed,
          labelText: labelText,
          onEditingComplete: onEditingComplete,
        );
      },
      optionsViewBuilder: (context, onSelected, options) => LayoutBuilder(
        builder: (p0, p1) => OptionViews<T>(
          listWidth: listWidth,
          onSelected: onSelected,
          liste: options,
          itemView: (p0) => Text(
            RawAutocomplete.defaultStringForOption(toStringMethod.call(p0)),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }

  void onEditingComplete(String? value) {
    final item = items.firstWhereNull(
      (element) =>
          turkish.toUpperCase(value ?? '') ==
          turkish.toUpperCase(toStringMethod.call(element)),
    );
    if (item != null) onSelected.call(item);
  }
}

final borderRadius2 = BorderRadius.circular(10);

class OptionViews<K extends Object> extends StatelessWidget {
  const OptionViews({
    required this.onSelected,
    required this.liste,
    required this.itemView,
    required this.listWidth,
    super.key,
  });

  final void Function(K) onSelected;
  final Iterable<K> liste;
  final Widget Function(K) itemView;
  final double? listWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: listWidth,
        child: Material(
          type: MaterialType.transparency,
          elevation: 4,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius2,
              side: BorderSide(color: context.colorScheme.primary, width: 2),
            ),
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: liste.length,
                shrinkWrap: true,
                itemBuilder: (_, index) => InkWell(
                  onTap: () => onSelected.call(liste.elementAt(index)),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: itemView.call(liste.elementAt(index)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OptionFieldView extends StatelessWidget {
  const OptionFieldView({
    required this.controller,
    required this.node,
    required this.onEditingComplete,
    super.key,
    this.onClearPressed,
    this.validator,
    this.prefixIcon = Icons.location_on_outlined,
    this.labelText = 'Kurum Adı',
  });

  final TextEditingController controller;
  final FocusNode node;
  final void Function()? onClearPressed;
  final String? Function(String?)? validator;
  final IconData prefixIcon;
  final String labelText;
  final void Function(String? value) onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: node,
      onChanged: onEditingComplete.call,
      onFieldSubmitted: onEditingComplete.call,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onEditingComplete: () => onEditingComplete.call(controller.text),
      inputFormatters: [
        CustomFormatters.uppercase(),
      ],
      onSaved: onEditingComplete.call,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear_rounded),
          onPressed: () {
            controller.clear();
            onClearPressed?.call();
          },
        ),
      ),
      validator: validator,
    );
  }
}
