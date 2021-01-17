# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context 'authenticated', shared_context: :metadata do
  before do
    @current_user = FactoryBot.create(:user)
    token = JWT.encode({ user_id: @current_user.id.to_s }, Rails.application.credentials.jwt_secret, 'HS256')
    @authenticated_headers = { 'Authorization' => "Bearer #{token}" }
  end
end

RSpec.describe 'Api::V1::Users', type: :request do
  let(:all_attributes) do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    {
      first_name: first_name,
      last_name: last_name,
      email: Faker::Internet.email(name: "#{first_name} #{last_name}", separators: '.'),
      password: Faker::Internet.password
    }
  end

  let(:valid_attributes) { all_attributes.slice(:first_name, :last_name, :email, :password) }
  let(:invalid_attributes) { all_attributes.slice(:first_name, :last_name, :password) }

  describe 'POST /api/v1/users' do
    context 'with valid parameters' do
      subject { post('/api/v1/users', params: {user: valid_attributes }) }

      it 'creates a new User' do
        expect { subject }.to change(User, :count).by(1)
      end
      it 'renders created status code' do
        subject
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      subject { post('/api/v1/users', params: { user: invalid_attributes }) }

      it 'does not create a new User' do
        expect { subject }.not_to change(User, :count)
      end

      it 'renders a JSON response with the errors' do
        subject
        expect(response.content_type).to include('application/json')
        expect(response.parsed_body).to eq('email' => ["can't be blank"])
      end

      it 'renders a unprocessable entity status code' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /api/v1/users/profile' do
    context 'when authenticated' do
      include_context 'authenticated'

      before { delete('/api/v1/users/profile', headers: @authenticated_headers) }

      it 'deletes the current user' do
        expect(User.where(id: @current_user.id).first).to be_nil
      end

      it 'renders a ok status code' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when not authenticated' do
      before { delete('/api/v1/users/profile') }

      it 'renders an unauthorized status code' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'POST /api/v1/users/login' do
    before { User.create(valid_attributes) }
    before { post('/api/v1/users/login', params: login_params) }

    context 'with valid parameters' do
      let(:login_params) { { user: valid_attributes.slice(:email, :password) } }

      it 'renders a JSON containing the user information' do
        expect(response.parsed_body.keys).to include('user')
      end

      it 'renders a JSON containing the generate token' do
        expect(response.parsed_body.keys).to include('token')
      end

      it 'renders an ok status code' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      let(:login_params) { { user: { email: valid_attributes[:email], password: 'fake_password' } } }
      it 'renders an unauthorized status code' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET /users/profile' do
    context 'when authenticated' do
      include_context 'authenticated'

      before { get('/api/v1/users/profile', headers: @authenticated_headers) }

      it 'renders a JSON containing the user information' do
        expect(response.parsed_body).to eq(@current_user.attributes.slice('first_name', 'last_name', 'email'))
      end

      it 'renders a OK status code' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when not authenticated' do
      before { get('/api/v1/users/profile') }

      it 'renders an unauthorized status code' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'PUT /users/profile' do
    context 'when authenticated' do
      include_context 'authenticated'

      context 'with valid attributes' do
        subject do
          put(
            '/api/v1/users/profile',
            params: { user: { first_name: 'other_first_name' } },
            headers: @authenticated_headers
          )
        end

        it 'updates the information about the user' do
          expect do
            subject
            @current_user.reload
          end.to change(@current_user, :first_name)
        end

        it 'renders a OK status code' do
          subject
          expect(response).to have_http_status(:ok)
        end
      end

      context 'with invalid attributes' do
        subject do
          put(
            '/api/v1/users/profile',
            params: { user: { first_name: '' } },
            headers: @authenticated_headers
          )
        end

        it 'does not update the informatino about the user' do
          expect do
            subject
            @current_user.reload
          end.not_to change(@current_user, :first_name)
        end

        it 'renders a JSON response with the errors' do
          subject
          expect(response.parsed_body).to eq('first_name' => ["can't be blank"])
        end

        it 'renders a unprocessable entity status code' do
          subject
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when not authenticated' do
      before do
        put(
          '/api/v1/users/profile',
          params: { user: { first_name: '' } }
        )
      end

      it 'renders an unauthorized status code' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
