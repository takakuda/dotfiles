factory_command = Pry::CommandSet.new do
  command 'fa', 'import factory_bot' do
    class Object
      include FactoryBot::Syntax::Methods
    end
    p 'FactoryBot!!!!!!'
  end
end
Pry.config.commands.import factory_command
