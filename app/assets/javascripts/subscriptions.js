$(function() {
  subClick()
})

function subClick() {
  $('a.view-subscriptions').on('click', function(e) {
    e.preventDefault();
    $.get('/api/subscriptions', function(response) {
      $('.subscriptions-index').html('')
      response.forEach(function(subscription) {
        var newSubscription = new Subscription(subscription.id, subscription.level, subscription.description);
        var formattedSubscription = newSubscription.formatSubscription();
        $('.subscriptions-index').append(formattedSubscription)
      })
    })
  })
}

function Subscription(id, level, description) {
  this.id = id;
  this.level = level;
  this.description = description;
}

Subscription.prototype.formatSubscription = function() {
  var subscriptionHtml = ''
  subscriptionHtml += '<h3>' + this.level + '</h3>'
  subscriptionHtml += '<p>' + this.description + '</p>'
  return subscriptionHtml
}
