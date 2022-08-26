class MentorSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :bio, :avatar, :created_at, :updated_at, :avatar_url
end
