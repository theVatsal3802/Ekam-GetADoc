class DateUtil {
  static String getMonth(String monthNumber) {
    String month = "";
    switch (monthNumber) {
      case "01":
        month = "Jan";
        break;
      case "02":
        month = "Feb";
        break;
      case "03":
        month = "Mar";
        break;
      case "04":
        month = "Apr";
        break;
      case "05":
        month = "May";
        break;
      case "06":
        month = "Jun";
        break;
      case "07":
        month = "Jul";
        break;
      case "08":
        month = "Aug";
        break;
      case "09":
        month = "Sep";
        break;
      case "10":
        month = "Oct";
        break;
      case "11":
        month = "Nov";
        break;
      case "12":
        month = "Dec";
        break;
    }
    return month;
  }

  static String getFullMonth(String monthNumber) {
    String month = "";
    switch (monthNumber) {
      case "01":
        month = "January";
        break;
      case "02":
        month = "February";
        break;
      case "03":
        month = "March";
        break;
      case "04":
        month = "April";
        break;
      case "05":
        month = "May";
        break;
      case "06":
        month = "June";
        break;
      case "07":
        month = "July";
        break;
      case "08":
        month = "August";
        break;
      case "09":
        month = "September";
        break;
      case "10":
        month = "October";
        break;
      case "11":
        month = "November";
        break;
      case "12":
        month = "December";
        break;
    }
    return month;
  }

  static String getDocDetDate(String date) {
    String d = "";
    String month = date.substring(5, 7);
    String day = date.substring(8);
    d = "$day ${getMonth(month)}";
    return d;
  }

  static String getBookingDate(String date) {
    String d = "";
    String year = date.substring(0, 4);
    String month = date.substring(5, 7);
    String day = date.substring(8);
    d = "${getMonth(month)} $day, $year";
    return d;
  }

  static String getReviewDate(
    String date,
    String time,
  ) {
    String d = "";
    String year = date.substring(0, 4);
    String month = date.substring(5, 7);
    String day = date.substring(8);
    d = "${getFullMonth(month)} $day, $year | $time";
    return d;
  }

  static String getConfirmDate(String date) {
    String d = "";
    String year = date.substring(0, 4);
    String month = date.substring(5, 7);
    String day = date.substring(8);
    d = "$day ${getMonth(month)}, $year";
    return d;
  }
}
