// User constructor
function User(id, first_name, last_name, username, email, subscription) {
  this.id = id;
  this.first_name = first_name;
  this.last_name =  last_name;
  this.username = username;
  this.email = email;
  this.subscription = subscription;
}

User.prototype.naming = function() {
  return this.first_name + " " + this.last_name;
}


$(function() {
  // open quick view
  $(document).on("click", ".js-more-user", function(e) {
    // ^^ I had to do this because once you click the link to the show pg, the ajax wasn't firing.
    e.preventDefault();

    $.get(this.href + ".json").success(function(response) {
      // console.log(response["id"])
      var userDiv = "#user-" + response["id"];

      var newUserInfo = new User(
        response["id"],
        response["first_name"],
        response["last_name"],
        response["username"],
        response["email"],
        response["subscription"]
      );

      // debugger

      // $(userDiv).html("<h3>" + newUserInfo.first_name + newUserInfo.last_name + "</h3>")
      $(userDiv).html("<h3>" + newUserInfo.naming() + "</h3>" +
        "<h4>" + "Username: " + newUserInfo.username + "</h4>" +
        "<h4>" + "Email: " + newUserInfo.email + "</h4>" +
        "<h4>" + "Subscription Level: " + newUserInfo.subscription.level + "</h4>" +
        "<p>" + "Subscription Description: " + newUserInfo.subscription.description + "</p>" +
        "<span>" + "See more about this user: " + "</span>" +
        "<a href=" + "/users/" + newUserInfo.id + ">" + newUserInfo.username + "</a>" + "<p></p>"
        );

        $(userDiv).toggle();

    }); // get

  }); // on click

}); // document ready
