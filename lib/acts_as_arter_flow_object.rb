#require 'afo/arter_flow_object'

require 'afo/acts_as_afo'

ActiveRecord::Base.send :include, ActsAsAFO
