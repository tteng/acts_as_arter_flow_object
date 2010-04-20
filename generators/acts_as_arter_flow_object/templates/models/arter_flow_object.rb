class ArterFlowObject < ActiveRecord::Base

  default_scope :order => "created_at desc"

  belongs_to :afoable, :polymorphic => true

  STEPS = [:design, :model, :map, :rig]

  STEPS.each do |s|
    self.class_eval <<-EOF
      belongs_to :#{s}_updater, :class_name => "User", :foreign_key => :#{s}_updater_id 
    EOF

    self.module_eval <<-MDE
      def toggle_#{s}! usr
        self.toggle "#{s}".to_sym
        self.#{s}_updater = usr
        save!
      end

      def #{s}_updater_name
        self.#{s}_updater.login rescue ''
      end
    MDE
  end

  def origin_human_type
    Kernel.const_get(self.afoable_type).human_name
  end

  def origin_name
    afoable.send(:title) rescue (afoable.send(:name) rescue 'Unknown')
  end

  def self.afo_types_for_select
    find(:all, :select => "DISTINCT afoable_type").inject([]){|ary,rcd| ary << [rcd.origin_human_type, rcd.afoable_type]}
  end

end
