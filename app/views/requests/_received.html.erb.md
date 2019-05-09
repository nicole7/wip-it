<% if current_user %>
  <ul class="show_requests">
    <% if current_user.pending_friends %>
      <% current_user.pending_friends.each do |user| %>

        <li class="requests">
          <% @friend_ids.each do |id| %>
          <h4 class="requester_info"> <%= link_to user.username, user_path(User.find(id)) %> wants to be your friend.</h4>
            <div class="btns">

              <%= link_to 'Accept', request_path(User.find(id)), method: :patch, class: 'add_button' %>
              <%= link_to 'Decline', request_path(User.find(id)), method: :delete, class: 'decline_button' %>
              <%end%>
            </div>
          <% end %>
    <% else %>
        <li>You do not have any pending requests right now!</li>
      <% end %>
      </li>
   </ul>
<% end %>
