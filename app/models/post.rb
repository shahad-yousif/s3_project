class Post < ApplicationRecord
	mount_uploader :file, FileUploader,

	
    :default_url => "/images/:style/missing.png",
    :url  => ":s3_domain_url",
    :path => "public/files/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]

    def file_name
    	File.basename(file.path || file.filename || file.fileid) 
    end

    
end
