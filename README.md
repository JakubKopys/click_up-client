## ClickUp::Client

Unofficial ClickUp API Client for Ruby.

Supports ClickUp API 2.0 - https://clickup.com/api

Development in progress - contributions are welcome!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'click_up-client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install click_up-client

## Usage

### Tasks

```ruby
require "click_up/client"

client = ClickUp::Client.new(api_token: YOUR_API_TOKEN)
tasks_client = client.tasks(list_id: YOUR_LIST_ID)

tasks_client.all # => fetches all unarchived tasks
tasks_client.all(archived: true) # => fetches all archived

tasks_client.find("abcd")

tasks_client.create({name: "New Task"})

tasks_client.update(task_id: "abcd", attributes: {name: "Updated Task"})

tasks_client.delete("abcd")
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JakubKopys/click_up-client.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
