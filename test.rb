require_relative './lib/oystercard'
require_relative './lib/station'
require_relative './lib/journey'
require_relative './lib/journey_log'

oc = OysterCard.new
s1 = Station.new('Barking',4)
s2 = Station.new('Aldgate',1)
s3 = Station.new('Canning Town',2)
s4 = Station.new('Whitechapel',1)
s5 = Station.new('Chelsea',1)

oc.topup(20)

p 'touch in s1'
 oc.touch_in(s1)
p 'touch out s2'
 oc.touch_out(s2)
p "balance: #{oc.balance}"
p ''
p 'touch in s3'
 oc.touch_in(s3)
p 'no touch out'

p 'touch in s4 (no touch out from before)'
 oc.touch_in(s4)
p "balance: #{oc.balance}"
p ''
p 'touch out s5'
 oc.touch_out(s5)
p "balance: #{oc.balance}"
p ''
oc.journeys


# TODO
# somehow get PENALTY fare without accessing constants directly
# Somehow create Journey hash with names..it breaks because of
# penalty fare since it can't get .name for nil class (incomplete journey)
