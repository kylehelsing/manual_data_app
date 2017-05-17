class DataPoint < ActiveRecord::Base
  POINT_TYPES = ["Proposals", "Implementations", "GitHub Issues", "Bills Overdue", "Calls Made", "Clients Behind", "Priorities", "Upcoming Events"]

  def self.dump
    recent = Hash.new
    DataPoint::POINT_TYPES.each do |x|
      recent[x] = DataPoint.where(:point_type => x).order(:created_at).last.to_hash if DataPoint.where(:point_type => x).present?
    end
    return recent
  end

  def to_hash
    return {value: point_value, aux: aux_data}
  end
end
