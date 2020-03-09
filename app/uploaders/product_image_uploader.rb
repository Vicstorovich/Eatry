class ProductImageUploader < ImageUploader
  version :thumb do
    process resize_and_pad: [150, 150]
  end

  version :thumb_2x do
    process resize_and_pad: [550, 550]
  end

  version :thumb_mini do
    process resize_and_pad: [50, 50]
  end
end
