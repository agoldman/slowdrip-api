json.outgoing_requests @outgoing do |outgoing_request|
	json.requested_friend outgoing_request.friend, :id, :name, :image, :uid, :email
end
json.incoming_requests @incoming do |incoming_request|
	json.requesting_friend incoming_request.user, :id, :name, :image, :uid, :email
end