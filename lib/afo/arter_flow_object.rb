class ArterFlowObject < ActiveRecord::Base

  default_scope :order => "created_at desc"

  belongs_to :afoable, :polymorphic => true

  STEPS = [:design, :model, :map, :rig]

  STEPS.each do |s|
    self.class_eval <<-EOF
      belongs_to :#{s}_updater, :class_name => "User", :foreign_key => :#{s}_updater_id 
    EOF
  end

  def self.afo_types_for_select
    find(:all, :select => "DISTINCT afoable_type").inject([]){|ary,rcd| tipe = rcd.call(:afoable_type); ary << [Kernel.const_get(tipe).human_name,tipe]}
  end

end
