class ApplicationController < ActionController::API
  before_action :authorize!

  def_param_group :pagination do
    param :page, Integer, desc: 'The number of page we want to access'
    param :size, Integer, desc: 'The size of the collection returned'
    param :order, String, desc: 'The field that we want to use for sorting'
    param :direction, ["asc", "desc"], desc: 'The direction of the sorted elements'
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.jwt_secret, 'HS256')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, Rails.application.credentials.jwt_secret, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged?
    !!current_user
  end

  def authorize!
    head :unauthorized unless logged?
  end

  def paginate(collection)
    orderable = collection.column_names.include? order
    collection.order(orderable ? order_text : nil ).page(page).per(size)
  end

  private

  # Pagination related methods used by the general paginate method above

  def pagination_params
    params.permit(:page, :size, :order, :direction)
  end

  def page
    pagination_params[:page]
  end

  def size
    pagination_params[:size]
  end

  def order
    pagination_params[:order]&.downcase
  end

  def direction
    pagination_params[:direction]&.downcase
  end

  def order_text
    modifier = direction == 'desc' ? 'desc' : 'asc'
    "#{pagination_params[:order]} #{modifier}"
  end

end