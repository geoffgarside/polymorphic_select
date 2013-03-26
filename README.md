polymorphic_select
==================

Rails 3.1 polymorphic_select view helper

### Usage

    = f.polymorphic_select :thingable, Thing.all.map { |t| [t.name, "Thing:#{t.id}"] }

Really must write some better usage docs....
