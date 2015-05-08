require 'test_helper'

class PatchesControllerTest < ActionController::TestCase
  setup do
    @patch = patches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patch" do
    assert_difference('Patch.count') do
      post :create, patch: { amount: @patch.amount, attack: @patch.attack, brute-factor: @patch.brute-factor, cutoff: @patch.cutoff, decay: @patch.decay, description: @patch.description, env-amt-2: @patch.env-amt-2, env-amt: @patch.env-amt, glide: @patch.glide, kbd-tracking: @patch.kbd-tracking, metalizer: @patch.metalizer, mod-wheel: @patch.mod-wheel, mode: @patch.mode, modmatrix: @patch.modmatrix, octave: @patch.octave, overtone: @patch.overtone, pattern: @patch.pattern, play: @patch.play, pulse-width: @patch.pulse-width, rate-2: @patch.rate-2, rate: @patch.rate, release: @patch.release, resonance: @patch.resonance, saw: @patch.saw, square: @patch.square, sub-fifth: @patch.sub-fifth, sustain: @patch.sustain, sync: @patch.sync, title: @patch.title, triangle: @patch.triangle, ultra-saw: @patch.ultra-saw, vca: @patch.vca, volume: @patch.volume, wave: @patch.wave }
    end

    assert_redirected_to patch_path(assigns(:patch))
  end

  test "should show patch" do
    get :show, id: @patch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patch
    assert_response :success
  end

  test "should update patch" do
    patch :update, id: @patch, patch: { amount: @patch.amount, attack: @patch.attack, brute-factor: @patch.brute-factor, cutoff: @patch.cutoff, decay: @patch.decay, description: @patch.description, env-amt-2: @patch.env-amt-2, env-amt: @patch.env-amt, glide: @patch.glide, kbd-tracking: @patch.kbd-tracking, metalizer: @patch.metalizer, mod-wheel: @patch.mod-wheel, mode: @patch.mode, modmatrix: @patch.modmatrix, octave: @patch.octave, overtone: @patch.overtone, pattern: @patch.pattern, play: @patch.play, pulse-width: @patch.pulse-width, rate-2: @patch.rate-2, rate: @patch.rate, release: @patch.release, resonance: @patch.resonance, saw: @patch.saw, square: @patch.square, sub-fifth: @patch.sub-fifth, sustain: @patch.sustain, sync: @patch.sync, title: @patch.title, triangle: @patch.triangle, ultra-saw: @patch.ultra-saw, vca: @patch.vca, volume: @patch.volume, wave: @patch.wave }
    assert_redirected_to patch_path(assigns(:patch))
  end

  test "should destroy patch" do
    assert_difference('Patch.count', -1) do
      delete :destroy, id: @patch
    end

    assert_redirected_to patches_path
  end
end
