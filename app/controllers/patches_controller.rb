class PatchesController < ApplicationController
    before_action :set_patch, only: [:show, :edit, :update, :destroy]

    # GET /patches
    # GET /patches.json
    def index
        @patches = Patch.all.order(average_rating: :desc, title: :asc)
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
        @patches = Patch.where(id: cookies[:favs].split(",").map{|x| x.to_i})
        puts @patches
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_patch
        @patch = Patch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patch_params
        params.require(:patch).permit(:title, :description, :sub_fifth, :overtone, :ultra_saw, :saw, :pulse_width, :square, :metalizer, :triangle, :cutoff, :mode, :resonance, :env_amt, :brute_factor, :kbd_tracking, :modmatrix, :octave, :volume, :glide, :mod_wheel, :amount, :wave, :rate, :sync, :env_amt_2, :vca, :attack, :decay, :sustain, :release, :pattern, :play, :rate_2)
    end
end
