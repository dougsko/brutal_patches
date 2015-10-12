class PatchesController < ApplicationController
    before_action :set_patch, only: [:show, :edit, :update, :destroy]

    # GET /patches
    # GET /patches.json
    def index
        if params["/patches"].present?
            @patches = Patch.search(params["/patches"][:query])
        else
            #@patches = Patch.all.order(created_at: :desc, average_rating: :desc)
            #@patches = Patch.all.order(created_at: :desc).page(params[:page])
            @patches = Patch.order(created_at: :desc).order(average_rating: :desc).page(params[:page])
        end
        render layout: "patch_index"
=begin
        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @patches }
            format.js 
        end
=end
    end

    # GET /patches/1
    # GET /patches/1.json
    def show
    end

    # GET /patches/new
    def new
        @patch = Patch.new
    end

    # GET /patches/1/edit
    def edit
    end

    # POST /patches
    # POST /patches.json
    def create
        @patch = Patch.new(patch_params)

        respond_to do |format|
            if @patch.save
                format.html { redirect_to @patch, notice: 'Patch was successfully created.' }
                format.json { render :show, status: :created, location: @patch }
            else
                format.html { render :new }
                format.json { render json: @patch.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /patches/1
    # PATCH/PUT /patches/1.json
    def update
        respond_to do |format|
            if @patch.update(patch_params)
                format.html { redirect_to @patch, notice: 'Patch was successfully updated.' }
                format.json { render :show, status: :ok, location: @patch }
            else
                format.html { render :edit }
                format.json { render json: @patch.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /patches/1
    # DELETE /patches/1.json
    def destroy
        @patch.destroy
        respond_to do |format|
            format.html { redirect_to patches_url, notice: 'Patch was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    # GET /patches/favs
    def favs
        if cookies[:favs]
            @patches = Patch.where(id: cookies[:favs].split(",").map{|x| x.to_i})
        else
            @patches = []
        end
        #puts @patches
        render layout: "patch_index"
    end

    def tag_cloud
        @tags = Patch.tag_counts_on(:tags)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_patch
        @patch = Patch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patch_params
        params.require(:patch).permit(:title, :description, :sub_fifth, :overtone, :ultra_saw, :saw, :pulse_width, :square, :metalizer, :triangle, :cutoff, :mode, :resonance, :env_amt, :brute_factor, :kbd_tracking, :modmatrix, :octave, :volume, :glide, :mod_wheel, :amount, :wave, :rate, :sync, :env_amt_2, :vca, :attack, :decay, :sustain, :release, :pattern, :play, :rate_2, :tag_list)
    end
end
