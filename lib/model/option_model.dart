class Option {
  String? optionText;
  String? id;

  Option({this.optionText, this.id});

  List<Option> optionsList() {
    return [
      Option(
        optionText: "Didn\'t apply to me at all",
      ),
      Option(
        optionText: "Applied to me to some degree,or some of the time",
      ),
      Option(
        optionText:
            "Applied to me to a considerable degree or a good part of time",
      ),
      Option(optionText: "Applied to me very much or most part of time"),
    ];
  }
}
