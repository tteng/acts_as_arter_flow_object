module ActsAsArterFlowObject

  def included(base)
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

    private

    def create_arter_flow_object
      arter_flow_object.create
    end
  
  end

end

ActiveRecord::Base.send :include, ActsAsArterFlowObject
