class PhotosFormBuilder < ActionView::Helpers::FormBuilder
    def button(cl_image_tag, options={})

        @template.button_tag(cl_image_tag, options)    
    end

end