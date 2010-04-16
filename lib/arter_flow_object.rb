class ArterFlowObject < ActiveRecord::Base

  belongs_to :afoable, :polymorphic => true

  STEPS = [:design, :model, :map, :rig]

  STEPS.each |s|
    class_eval <<-EOF
      belongs_to :#{s}_updater, :class => "User", :foreign_key => :#{s}_updater_id 
    EOF
  end

end
