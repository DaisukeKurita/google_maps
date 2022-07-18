class DiariesController < ApplicationController
  before_action :set_diary, only: %i[show edit update destroy]
  before_action :assignment_to_diary_instance_and_gon_lat_lng, only: %i[confirm create]

  def index
  end

  def show
  end

  def new
    @diary = Diary.new
  end

  def edit
    # 『@diary.addressに値が存在する場合』は...
    return unless @diary.address.present?

    # 『gon.lat_lng』に [@diary.latitude, @diary.longitude]を代入する
    gon.lat_lng = [@diary.latitude, @diary.longitude]
  end

  def confirm
    render :new if @diary.invalid?
  end

  def create
    return render :new if params[:back]

    if @diary.save
      redirect_to diaries_path
    else
      render :new
    end
  end

  def update
    if @diary.update(diary_params)
      redirect_to diaries_path
    else
      render :edit
    end
  end

  private

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:title, :content, :address)
  end

  def assignment_to_diary_instance_and_gon_lat_lng
    @diary = Diary.new(diary_params)
    # 『gon.lat_lng』に緯度・経度を代入
    # 仮に『@diary.address = '東京タワー'』だった場合
    # 『gon.lat_lng = [35.6585805, 139.7454329]』と代入される
    # 『@diary.address = ''』だった場合は『nil』が代入される
    gon.lat_lng = Geocoder.coordinates(@diary.address)
  end
end
