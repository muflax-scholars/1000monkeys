#!/usr/bin/env ruby
require './lib.rb'

syllables, rhymeparts = load_dictionary(ARGV[0])
words = load_distribution(ARGV[1])

map do |line|
  word, stripped, line, meter = "", "", "", ""

  8.times do
    if word == ""
      word = words.keys.sample
    else
      word = words[word].sample
    end

    unless syllables.has_key?(word.cleaned)
      word, line, meter = "", "", ""
      redo
    end

    line += word + " "
    meter += syllables[word.cleaned]

    break if words[word].nil? or words[word].empty?
  end
  puts "#{rhymeparts[word.cleaned]}\t#{line}"
end
