require 'wongi-engine/dsl'
include Wongi::Engine::DSL

engine = Wongi::Engine.create

engine << ["Alice",:friend,"Bob"]
engine << ["Alice",:age,35]


engine.each("Alice",:_,:_) do |elem|
  puts "Alice's #{elem.predicate} is #{elem.object}"
end
