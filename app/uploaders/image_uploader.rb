class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.test?
    def cache_dir
      "#{Rails.root}/spec/support/uploads/tmp"
    end
    def store_dir
      "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}"
    end
  else
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}"
    end
  end

  def default_url
    "/images/fallback/#{model.class.to_s.underscore}/#{mounted_as}/" + ['default', version_name].compact.join('_') + '.png'
  end

  # 画像の最大サイズ
  process resize_to_limit: [1200, 1200]

  # Exif情報のOrientationから画像をよしなにしてくれる
  process :fix_exif_rotation

  # アップロード可能な画像拡張子
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def fix_exif_rotation
    manipulate! do |img|
      img.auto_orient
      img = yield(img) if block_given?
      img
    end
  end
end
