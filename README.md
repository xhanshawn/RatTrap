# RatTrap

A simple tool to extract or read MessagePack files.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rat_trap'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rat_trap

## Usage

### Unpack

You can unpack your message pack file to a text file.
```
rat up <your_message_pack_file>.bin
```
It will create a new file called `<your_message_pack_file>.bin.unpacked`

### Run

Add what command you want to run against your message pack file. For example, if I want to use vim to open the unpacked file, I just need to run.
```
rat r vi <your_message_pack_file>.bin
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rat_trap/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
