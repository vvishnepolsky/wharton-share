class DownloadsController < ApplicationController

  def new
    @download = Download.new
  end

  def create
    @download = Download.new(download_params)
    @download.save
  end


  private

  def download_params
    params.require(:download).permit(:user_id, :asset_id)
  end

end
