User
    - username
    - email
    - password_digest
    has_many :tricks
    has_many :tips
    has_many :trick_tips, through: :tips, source: :tricks
    has_many :categories, through: :tricks

Trick
    - trick
    belongs_to :user
    belongs_to :category

Tip
    - tip
    belongs_to :user
    belongs_to :trick

Category
    - name
    has_many :tricks
    has_many :users, through: :tricks



rails g resource user username email password_digest --no-test-framework
rails g resource tip user:belongs_to trick:belongs_to --no-test-framework
rails g resource trick user:belongs_to category:belongs_to --no-test-framework
rails g resource category name --no-test-framework


rails generate controller home index  --no-helper --no-assets --no-controller-specs --no-view-specs

---------

<%= form_for(@trick) do |f| %>

<%= f.label :name %>
<%= f.text_field :name %>

<%= f.submit %>

<% end %>

<ul>
    <% @tricks.each do |p|%>
      <li><%= link_to p.name, trick_path(p) %> - <%= p.name%> </li>
    <% end %>
</ul>

==========================================

<h1>SIGN UP</h1>


<ul>
    <% @user.tricks.each do |t|%>
      <li><%= link_to t.name, trick_path(t) %> - <%= t.name%> </li>
    <% end %>
</ul>



<%= form_for @user, url:'/signup' do |f| %>
<%= f.label :username %>
<%= f.text_field :username %>

<%= f.label :email %>
<%= f.email_field :email, required:true %>

<%= f.label :password %>
<%= f.password_field :password %>

<%= f.submit "Submit"%>
<% end %>


