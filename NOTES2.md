
<h2>SIGN UP</h2>

<%= form_for(@user) do |f| %>
  <%= f.label :first_name %>
  <%= f.text_field :first_name %><br>

  <%= f.label :last_name %>
  <%= f.text_field :last_name %><br>

  <%= f.label :username %>
  <%= f.text_field :username %><br>

  <%= f.label :email %>
  <%= f.email_field :email %><br>

  <%= f.label :password %>
  <%= f.password_field :password %><br>

  <%= f.label :password_confirmation %>
  <%= f.password_field :password_confirmation %><br>

  <%= f.label :subscription_level %>
  <%= f.collection_select(:subscription_id, Subscription.all, :id, :level) %><br>

  <%= f.label :role %>
  <%= f.select :role, ["subscriber"] %><br>

  <%= f.submit %>
<% end %>





<div class="field">
  <%= f.label :password %>
  <% if @minimum_password_length %>
  <em>(<%= @minimum_password_length %> characters minimum)</em>
  <% end %><br />
  <%= f.password_field :password, autocomplete: "off" %>
</div>

<div class="field">
  <%= f.label :password_confirmation %><br />
  <%= f.password_field :password_confirmation, autocomplete: "off" %>
</div>
