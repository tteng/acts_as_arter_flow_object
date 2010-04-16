class ArterFlowObject < ActiveRecord::Base

  belongs_to :afoable, :polymorphic => true

  STEPS = [:design, :model, :map, :rig]

  STEPS.each do |s|
    self.class_eval <<-EOF
      belongs_to :#{s}_updater, :class_name => "User", :foreign_key => :#{s}_updater_id 
    EOF
  end

end
