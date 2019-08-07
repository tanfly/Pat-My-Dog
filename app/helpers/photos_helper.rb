module PhotosHelper
    def photo_pat_count(photo)
        if photo.pat_count > 0
            photo.pat_count
        else
            "Oh no! No pats for this good doggo yet. You can be the first!"
        end
    end
end
