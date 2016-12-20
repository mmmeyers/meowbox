<h4>Filter boxes by subscription level:</h4>
<%= form_tag("/boxes", method: "get") do %>
  <%= select_tag "subscription", options_from_collection_for_select(@subscriptions, "id", "level"), include_blank: true %>
  <%= submit_tag "Filter" %>
<% end %>

// From the boxes index page
