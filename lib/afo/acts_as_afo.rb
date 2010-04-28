module ActsAsAFO

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    def acts_as_arter_flow_object options={}
      default_options = { :as => :afoable, :dependent => :destroy }  
      default_options.merge!(options) unless options.empty?
      has_one :arter_flow_object, default_options
      include InstanceMethods
    end

  end

  module InstanceMethods
    
    def after_create
      super
      create_arter_flow_object
    end

    # lazy generating
    # 'cause before user run " script/generate acts_as_arter_flow_object", 
    # acts_as_arter_flow_object.rb has not been copied to app/models,
    # and this will caused a "uninitialized constant ActsAsAFO::InstanceMethods::ArterFlowObject" error.
    klazz = Kernel.const_get("ArterFlowObject") rescue nil
    unless klazz.nil?
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
    end 

    private

    def create_arter_flow_object
      p self.class
      arter_flow_object.create 
    end
 
  end

end
