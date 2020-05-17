# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Temporary: just used to ensure all the ER associations, callbacks, state meachines, concerns are working.

Location.utah.save!
location = Location.utah
source = Source.create!(name: 'name', citation: 'citation', creator_id: 1)
slip = Slip.create!(name: 'name', body: 'body', creator_id: 1, source: source)
rule = Rule.new(name: 'name', body: 'body', creator_id: 1)
rule.slips << slip
rule.save!
ruleset = Ruleset.new(name: 'name', creator_id: 1)
ruleset.rules << rule
ruleset.save!
processor = Processor.create!(name: 'name', ruleset: ruleset, creator_id: 1)
datum = Datum.create!(label: 'label', processor: processor, reference: location, integer_value: 42)
