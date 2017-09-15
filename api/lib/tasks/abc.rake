



namespace :rules do
  task engine: :environment do
    include Wongi::Engine::DSL

    engine = Wongi::Engine.create

    engine << ["Alice",:friend,"Bob"]
    engine << ["Alice",:age,35]
    engine.retract ["Alice", :age, 35]

    engine.each("Alice",:_,:_) do |elem|
      puts "Alice's #{elem.predicate} is #{elem.object}"
    end

    engine << ["Bob",:friend,"Jack"]
    friends= engine.rule "friends" do
      forall {
        has :A,:friend,:B
        has :B,:friend,:C
      }
    end

    friends.tokens.each do |token|
      puts "%s and %s are friends through %s" %[token[:A],token[:B],token[:C]]
    end


  end
end