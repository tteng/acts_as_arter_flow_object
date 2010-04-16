class <%= migration_name %> < ActiveRecord::Migration
  def self.up
    create_table :arter_flow_objects do |t|
      t.integer :afoable_id
      t.string  :afoable_type
      ArterFlowObject::STEPS.each do |step|
        t.boolean step
        t.references "#{step}_updater".to_sym
      end
      t.timestamps
    end
  end
  
  def self.down
    drop_table :arter_flow_objects
  end
end
