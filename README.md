# FormattedForm - Under development!

FormattedForm aims to provide a clean formatting to forms, while leaving full customizability to the user.

### Install

### Config

### Usage

##### Wrapper

FormattedForm generates a div-wrapper around every input field.
Html options can be passed to the wrapper using a hash for wraper.
```
<%= f_form_for :user do |f| %>
  <%= f.text_field :name, wrapper: { id: "name_wrapper" } %>
  <%= f.password_field :password, wrapper: { class: "password_wrapper" } %>
<% end %>
```

##### Label

FormattedForm generates a label for every input field.
Html options can be passed to the label using a hash for label.
```
<%= f_form_for :user do |f| %>
  <%= f.text_field :name, label: { id: "name_label" } %>
  <%= f.password_field :password, label: { class: "password_label" } %>
<% end %>
```

If you want to skip a label for a certain input, simply add skip_label as options.
```
<%= f_form_for :user do |f| %>
  <%= f.text_field :name, skip_label: true %>
<% end %>
```
