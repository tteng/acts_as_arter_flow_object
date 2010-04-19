class ActsAsArterFlowObjectGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
  end
  
  def manifest
    recorded_session = record do |m|
      unless options[:skip_migration]
        m.migration_template 'migration.rb', 'db/migrate', 
         :assigns => { :migration_name => "CreateArterFlowObjectsTable" },
         :migration_file_name => "create_arter_flow_objects_table"
        m.route_resources :arter_flow_objects
      end
    end
    
    action = nil
    action = $0.split("/")[1]
    case action
      when "generate" 
        puts
        puts ("-" * 70)
        puts "Success!"
        puts
        puts "Dont't Forget to:"
        puts "  - Add the acts_as_arter_flow_object to the model that accepts afo objects"
        puts
        unless options[:skip_migration]
          puts "  - Run the migration."
          puts "      rake db:migrate"
        end
        puts
        puts
        puts ("-" * 70)
        puts
      else
        puts
    end

    recorded_session  
  end
  
end
