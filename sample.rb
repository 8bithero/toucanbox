#!/usr/bin/env ruby
require_relative 'lib/content_chooser.rb'

USERS = [
  { name: 'Steve', received_contents: ['1a', '1b', '3c'] },
  { name: 'Virginie', received_contents: ['3a', '2b', '3c'] },
  { name: 'Fiona', received_contents: ['1b', '2a', '3b'] },
  { name: 'Jenny', received_contents: ['3b', '2c', '1b'] },
  { name: 'James', received_contents: ['2b', '1b', '3a'] },
  { name: 'Fede', received_contents: ['2c', '3a', '1c'] },
  { name: 'Sara', received_contents: ['3a', '2c', '3b'] },
  { name: 'Tizi', received_contents: ['2b', '1b', '2a'] },
  { name: 'Thomas', received_contents: ['3c', '2b', '1a'] },
]

BOX_CODES = [
  { code: 'gr1', contents: ['1a', '1b'], type: :petite },
  { code: 'gr2', contents: ['1a', '2b'], type: :petite },
  { code: 'gr3', contents: ['1b', '2c'], type: :petite },
  { code: 'gr4', contents: ['2c', '3c'], type: :petite },
  { code: 'gr5', contents: ['3b', '1c'], type: :petite },
]

chooser = ContentChooser.new(BOX_CODES)
results = chooser.call(USERS)

puts "---------------------------------------------"
puts "Printing users and the boxes they can be sent"
puts "---------------------------------------------"
results.each do |user|
  puts "#{user[:name]}: " + user[:available_boxes].join(", ")
end
puts "---------------------------------------------"
