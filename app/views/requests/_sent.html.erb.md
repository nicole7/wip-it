<ul class="sent_requests">
  <% if @sent %>
    <% @sent.each do |request| %>

      <li class="sent">

        <h4 class="sent_to_info"><%= link_to request.friend.name, user_path(request.friend) %></h4>
    <% end %>
    <% else %>
    <li>No pending requests.</li>
    </li>
  <% end %>
 </ul>