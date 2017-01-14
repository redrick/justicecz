# Justicecz

[![Build Status](https://travis-ci.org/redrick/justicecz.svg?branch=master)](https://travis-ci.org/redrick/justicecz)

COMMING SOON

SDK for accessing data from [justice.cz](https://or.justice.cz/ias/ui/rejstrik-$firma)

## Installation

Add this line to your application's Gemfile:

    gem 'justicecz'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install justicecz

## Usage

In this first version you can query justice.cz looking for specific ICO:

```ruby
Justicecz::Query.query(ico: '04564634')
```

Which will give you nicely formatted Hash for further processing:

```
{
  "Název subjektu:" => "autokosmetika s.r.o.",
  "IČO:"            => "04564634",
  "Spisová značka:" => "C 249833 vedená u Městského soudu v Praze",
  "Den zápisu:"     => "13. listopadu 2015",
  "Sídlo:"          => "Jičínská 226/17, Žižkov, 130 00 Praha 3"
}
```


## Thanks

[Tomas Dvorak](https://github.com/todvora) for his article on problems with [justice.cz](https://www.tomas-dvorak.cz/posts/nacitani-dat-z-obchodniho-rejstriku-justicecz/)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/justicecz/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
