# Justicecz

[![Build Status](https://travis-ci.org/redrick/justicecz.svg?branch=master)](https://travis-ci.org/redrick/justicecz)

SDK for accessing data from [justice.cz](https://or.justice.cz/ias/ui/rejstrik-$firma)

## Installation

Add this line to your application's Gemfile:

    gem 'justicecz'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install justicecz

## Usage

In this gem you can query justice.cz looking for things available throught
their website, see examples below:

```ruby
Justicecz::Query.query(ico: '04564634')
```

Which will give you collection of results encapsulated in `Justicecz::Entities::List` class

```ruby
#<Justicecz::Entities::List:0x007f8b8b44f430 @items=[#<Justicecz::Entities::Company:0x007f8b8b4455e8>]>.........>
```

To access all results you call `items` like this:

```ruby
collection = Justicecz::Query.query(nazev: 'NAV')
collection.items
```

it returns an array of results each now encapsulated in `Justicecz::Entities::Company` class

```ruby
#<Justicecz::Entities::Company:0x007f8b8b4455e8 @title="Návrat bytové družstvo", @ico="43003940", @file_number="DrCI 166 vedená u Městského soudu v Praze", @registered_at="11. listopadu 1991", @residence="Praha 4, Stallichova 932/9">
```

with which you can now easily work to get required data :) (see more on methods available below...)


### Justicecz::Query public API

With this class you can query like this:

```ruby
collection = Justicecz::Query.query(nazev: 'NAV')
```

tested params in search for now are:

```ruby
{
  nazev: 'string',          # search by name of the company
  ico: '04564634',          # ICO of the company (unique returns only one result in collection.items array)
  obec: 'Brno',             # name of the city (has to be combined with one of required - see required down below)
  ulice: 'Černokostelecká', # name of street (has to be combined with one of required - see required down below)
  polozek: 200,             # allows you to get more that default 50 results (allowed 50, 200, 500)
  soud: 'KSPL'              # Court of registration (see values below) + (has to be combined with one of required - see required down below)
}
```

REQUIRED FIELDS (one of) -> `nazev` or `ico`

Allowed values for `soud` params in search hash:

```
"MSPH" => Městský soud v Praze
"KSCB" => Krajský soud v Českých Budějovicích
"KSPL" => Krajský soud v Plzni
"KSUL" => Krajský soud v Ústí nad Labem
"KSHK" => Krajský soud v Hradci Králové
"KSBR" => Krajský soud v Brně
"KSOS" => Krajský soud v Ostravě
```

### Jistice::Entities::List public API

This class only offers:

```ruby
collection = Justicecz::Query.query(nazev: 'NAV')
collection.items # array of items
```

### Justicecz::Entities::Company public API

This class offers these methods to access company data fetched:

```ruby
collection = Justicecz::Query.query(nazev: 'NAVLOG')
item = collection.items.first
item.title          # "NAVLOG s.r.o."
item.misc           # Miscellaneous -> e.g. "V konkursu, Zahájeno insolvenční řízení na návrh věřitele"
item.ico            # "29453259"
item.file_number    # "C 54544 vedená u Krajského soudu v Ostravě"
item.registered_at  # "26. září 2012"
item.residence      # "Ztracená 253/4, 779 00 Olomouc"
```

You can then access the full name of attribute and value appending `_full` after:

```ruby
collection = Justicecz::Query.query(nazev: 'NAVLOG')
item = collection.items.first
item.title_full          # "Název subjektu: NAVLOG s.r.o."
item.misc_full           # Miscellaneous -> e.g. "Ostatní informace: V konkursu, Zahájeno insolvenční řízení na návrh věřitele"
item.ico_full            # "IČO: 29453259"
item.file_number_full    # "Spisová značka: C 54544 vedená u Krajského soudu v Ostravě"
item.registered_at_full  # "Den zápis: u26. září 2012"
item.residence_full      # "Sídlo: Ztracená 253/4, 779 00 Olomouc"
```

Also if you only want to know header names (.ico => 'IČO') append `_header` after:

```ruby
collection = Justicecz::Query.query(nazev: 'NAVLOG')
item = collection.items.first
item.title_header          # "Název subjektu"
item.misc_header           # "Ostatní informace"
item.ico_header            # "IČO"
item.file_number_header    # "Spisová značka"
item.registered_at_header  # "Den zápis"
item.residence_header      # "Sídlo"
```

## TODO

* Discover search more
* Specs
* More comprehensive documentation
* Bugfixes

## Thanks

[Tomas Dvorak](https://github.com/todvora) for his article on problems with [justice.cz](https://www.tomas-dvorak.cz/posts/nacitani-dat-z-obchodniho-rejstriku-justicecz/)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/justicecz/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
