# Movies#index
- Small plex movie placeholder: https://via.placeholder.com/123x185/000000/FFFFFF?text=movie
- Large plex movie placeholder: https://via.placeholder.com/240x360/000000/FFFFFF?text=movie

<div>
  <h1> <%= @user.name %> </h1>

  <% if @user.lists.any? %>
    <h3> Lists (<%= @user.lists.count %>) </h3>
    <ol>
      <%= render @lists %>
    </ol>
    <%= will_paginate @lists %>
  <% end %>
</div>
