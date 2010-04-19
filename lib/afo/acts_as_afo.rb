module ActsAsAFO

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    def acts_as_arter_flow_object
      has_one :arter_flow_object, :as => :afoable, :dependent => :destroy
      include InstanceMethods
    end

  end

  module InstanceMethods
    
    def after_create
      super
      create_arter_flow_objecjt
    end

    ArterFlowObject::STEPS.each do |s|
      module_eval <<-EOF
        def #{s}ed?
          !!arter_flow_object.send(:#{s}) rescue false
        end

        def toggle_#{s}!(usr)
          raise ActiveRecord::RecordNotFound.new("no corresponding arter flow object record found")  unless arter_flow_object
          arter_flow_object.toggle(:#{s})
          arter_flow_object.#{s}_updater = usr
          arter_flow_object.save
        end
      EOF
    end

    private

    def create_arter_flow_object
      arter_flow_object.create
    end
 
  end

end
