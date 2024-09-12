# README

Learnings for Rails during Discovery, you can find the quick notes below

# Commands
2024-09-11 13:28

Status: #atom 

Tags:  [[Programming]] [[Ruby on Rails]] [[Ruby]] [[Rails]]

```table-of-contents
title: #### Table of Contents
style: nestedList
includeLinks: true
```

# Overview

```
rake ...
```
- Used for automation in RoR
- Can be used to seed (add mock data in db), run db migrations, and other maintenance taks

```
rails generate controller <Controller Name> index
```
- Automatically generate route and controller for controller ame
- Also generate other files such as test and erb


```
rails generate model <Model Name> <Coloum Name 1>:<type> <Coloum Name 2>:<type> ...
```
 - After creating a model, you need to migrate
 
```
rails db:migrate
```
- This migrates the model changes and relfects the changes on the actual DB?

```shell
rails console
```
 - The rails console can be used to directly interact with rails
 - For example you can 
	 - Directly create, and save database entries
	 - List model entries
- Examples:
```ruby
{ModelName.all} -> # return all rows in model
{ModelName.find(1)} -> # find model with specific id
model = {ModelName}.new(col1: 'value', col2: value)
```
**Automatic CRUD routes** 
```ruby
# /routes.rb
resources :articles
```
- This creates automatic CRUD routes, and *helper* methods such as:
	- prefix_path or prefix_url
- You can represent  hierarchical relationships
```ruby

resources :articles do
	resources :comments
```
# Variable Identifiers

| Nothing | @        | @@    | $               | Caps              |
| ------- | -------- | ----- | --------------- | ----------------- |
| local   | instance | class | global variable | constant variable |
- You do not need require under app at all
	- Rails handles the loading for you
- For example:
```ruby
# DO NOT DO THIS
require 'application_controller'
```

# Active Record
When generating an entity with with a relationship, you can use the following command:
```ruby
generate model <Model Name> <name>:references
```
> It is important to note that the belongs_to(child) Active Record *association* will automatically be created, but the has_many(parent) must manually be added

# ERB
Embedded Ruby, or ERB, is a the HTML templating engine? that allows ror to dynamically render html files

## Partials
Partials are defined using an underscore in the front of the file name
- ex. _ comment.html.erb. (no space)

When using these partials you can pass in the name of the partial, along with the instance varible that the partial consumes
```ruby
<%= render "form", article: @article %>
```

> But, there is some magic when using partials, for example the follow automatically renders a partial

```ruby
<%= render @article.comments %>
```


> [!question] How?
> In RoR, the follow occurs:
> 1. The expression, @article.comments (@variable.association), returns an Object Comment
> 2. This is converted to lowercase and single word (seperated with underscore)
> 3. RoR then knowns to look for _ comment.html.erb


## Migrations
Migrations are a method of updating your database. To create a migration in rails you can run the following command:
```ruby
# Example, adding a new coloumn
rails generate migration <NameOfMigration> <column_name>:<type>
```
> NameOfMigration follows a convention that allows rails to identify the TYPE of migration and the TABLE that is being altered 

> [!important]
>  Prior to running the migration command (rails db:migrate) you can CHANGE the migration file to add any defaults or changes.
>  - If you prefer to make direct changes after, you can use the rails console

# Model
In a Rails view, you "magically" tend to have access to a number of different things and variables, but what?

**As per GPT:**
In a Rails view, you have access to:
- **Instance Variables**: Data passed from the controller.
- **Local Variables**: Variables passed to partials.
- **Helpers**: Built-in and custom helper methods.
- **Partials**: Reusable view components.
- **Layouts**: Common structure for views.
- **Flash Messages**: Temporary messages for the user.
- **Params**: Request parameters.
- **Session**: Session data.
- **Current User**: Authentication data.
>GPT Reference https://chat.shopify.io/share/KoGq02wOaTQn0-O2XVJRf

# Controller
The params hash has access to *the data sent by the client to the client IN the request*, such as:
- query params
- form data
- route params
- nested params
- file uploads

# Configuration Gotchas

> [!tldr] 
> Generally, you want to use UTF-8 for ALL external data, as if you do not, this can cause issues with rendering and saving presistent data in a DB
> - Rails and Ruby do try to convert all data to UTF-8, but this is not reliable

# Reference
- https://guides.rubyonrails.org/getting_started.html#updating-an-article
- [[chatgpt]]
	- https://chat.shopify.io/share/KoGq02wOaTQn0-O2XVJRf
- [[my brain]]

