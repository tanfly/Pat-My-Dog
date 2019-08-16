module PhotosHelper
    def photo_pats?(photo)
        unless photo.pats.count > 0
            "Oh no! No pats for this good doggo yet. You can be the first!"
        end
    end

    def photo_comments?(photo)
        unless photo.comments.where("content is not null and content != ''").any?
            "No comments yet! You can be the first"
        end
    end

    
    #has to be done on the upload, this won't work 
    def be_straight(photo)
        split = photo.image.url.split("/")
        split[5] << "/a_ignore"
        split.join("/")
    end

end
