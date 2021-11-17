class ApiController < ActionController::API

  def render_response(data=nil, serializer=nil, status=200)
    render json: {
      data: ActiveModelSerializers::SerializableResource.new(data, each_serializer: serializer),
      status: status,
    }
  end

end