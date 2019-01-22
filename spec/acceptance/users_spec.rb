require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Users (V1)" do

  let(:user) {User.create(email: "NiceLady77@gmail.com", password: "asdf12312as")}
  let(:id) {user.id}
  before do
  #TODO: Figure out how to share among specs
  	auths = user.create_new_auth_token
  	header 'access-token', auths['access-token']
  	header 'token-type', auths['token-type']
  	header 'client', auths['client'] 
  	header 'expiry', auths['expiry']
  	header 'uid', auths['uid']
  	header "Content-Type", "application/json"
  end

  get "api/v1/users/:id" do
  	parameter :id, "The id of the user you wish to view.", 'Type' => 'Integer'
    
    response_field :id, "The user's id.", 'Type' => 'Integer', scope: :user
    response_field :name, "The user's name.", 'Type' => 'Integer', scope: :user
    response_field :image, "The user's image", 'Type' => 'Integer', scope: :user
    response_field :email, "The users's email", 'Type' => 'Integer', scope: :user
    response_field :droplets, "The user's droplets for today", 'Type' => 'Array', scope: :user

    context '200' do
      example 'Show a user' do
	      do_request
		  expected_response = {
		    user: {
		      id: user.id,
		      name: user.name,
		      image: user.image,
		      email: user.email,
		      droplets: [],
          algo: "all_time",
          base_iterator: nil
		      #TODO: test actual seeded droplets response
		    }
		  }.to_json
	      expect(status).to eq(200)
	      expect(response_body).to eq(expected_response)
	  end
    end
  end
end