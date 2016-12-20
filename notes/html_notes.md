click more button
<button class="js-more" data-id="<%= subscription.id %>">More</button>


Subscriptions index:
<% @subscriptions.each do |subscription| %>
<li class="list-group-item">
  <h4 class="list-group-item-heading"><%= link_to subscription.level, subscription_path(subscription) %> </h4>
  <div id="subscription-<%= subscription.id %>"></div>
  <%= link_to "More info", subscription_path(subscription), :class => "js-more" %>
  <div id="subscription-<%= subscription.id %>-level"></div>
</li>
<% end %>
