# README

Learnings for Rails during Discovery, you can find the quick notes below


# Commands
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

