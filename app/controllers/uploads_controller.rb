class UploadsController < ApplicationController
  def index
    files = []
    Upload.all.each { |u| u.files.each { |f| files << { file: f, filename: f.filename.to_s } } }
    @files = files.uniq { |f| f[:filename] }
  end

  def new
    @upload = Upload.new
  end

  def show
  end

  def create
    @upload = Upload.new(upload_params)

    if @upload.save
      redirect_to root_path
      flash[:success] = "File(s) were successfully uploaded"
    else
      redirect_to root_path
      flash[:danger] = "An error occurred while uploading files. Please try again."
    end
  end

  def upload_params
    params.require(:upload).permit(:name, files: [])
  end
end
