# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

<div class="container my-3">
  <h5><%= @list.name %></h5>
  <% @list.movies.each do |movie| %>
  <div class="row">
    <div class="col-4">
      <p><%= image_tag movie.poster_url, alt: movie.title, class: 'movie-img rounded-top' %></p>
    </div>
  </div>
    <p><%= movie.title %></p>
    <p><%= movie.overview %></p>
    <p><%= movie.rating %></p>
  <% end %>
  <br>
  <div>
      <%= simple_form_for [@list, @bookmark] do |f| %>
        <%= f.association :movie %>
        <%= f.input :comment %>
        <%= f.button :submit, class: 'btn btn-secondary' %>
      <% end %>
  </div>

  
