class CloudComputingSerializer < ActiveModel::Serializer
  attributes :payload, :timestamp, :execution_delay
end
