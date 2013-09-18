class Blog::Comment < Wheelhouse::EmbeddedResource
  property :id, MongoModel::Reference, :as => '_id', :default => proc { ::BSON::ObjectId.new.to_s }
  
  property :author, String, :required => true
  property :email, String, :required => true
  property :comment, String, :required => true
  property :posted_at, Time, :required => true
  
  def email_with_author_name
    "#{author} <#{email}>"
  end
end