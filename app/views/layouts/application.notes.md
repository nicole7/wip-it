######
<!--  <% if logged_in? %> -->
<!--
          <li class="nav-item active"><%= link_to "#{current_user.first_name}'s Profile", user_path(current_user.id), class: "nav-link"  %></li>
          <li class="nav-item active"><%= link_to "logout", logout_path, class: "sr-only" %></li>
          <a class="nav-link" href="#">Home
                <span class="sr-only">(current)</span>
              </a>
          <li class="nav-item active"><%= link_to "About", about_path, class: "sr-only" %></li>
          <li class="nav-item">
              <a class="nav-link"><%= link_to "#{current_user.first_name}'s Profile", user_path(current_user.id), class: "sr-only"%>Profile</li>
          <!--<% else %> -->
         <!--  <li class="nav-item active"><%= link_to "Home", root_path, class: "sr-only"  %></li>

          <li class="nav-item active"><%= link_to "Register", new_user_path, class: "sr-only" %></li>

          <li class="nav-item active"><%= link_to "Login", new_session_path, class: "sr-only" %>
          </li>
            <li class="nav-item active"><%= link_to "about", about_path, class: "sr-only" %></li> -->
          <!--<% end %>-->


           <!-- <li class="nav-item">
              <a class="nav-link"><%= link_to "Profile", user_path(@current_user.id) %>Profile</a>
            </li> -->

                <!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">

          <h1 class="my-4">recipes</h1>
          <div class="list-group">
            <a href="#" class="list-group-item">Category 1</a>
            <a href="#" class="list-group-item">Category 2</a>
            <a href="#" class="list-group-item">Category 3</a>
          </div>

        </div>