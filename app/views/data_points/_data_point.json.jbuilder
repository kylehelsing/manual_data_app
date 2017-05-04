json.extract! data_point, :id, :point_type, :point_value, :aux_data, :created_at, :updated_at
json.url data_point_url(data_point, format: :json)
