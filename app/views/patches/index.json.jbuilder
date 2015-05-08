json.array!(@patches) do |patch|
  json.extract! patch, :id, :title, :description, :sub-fifth, :overtone, :ultra-saw, :saw, :pulse-width, :square, :metalizer, :triangle, :cutoff, :mode, :resonance, :env-amt, :brute-factor, :kbd-tracking, :modmatrix, :octave, :volume, :glide, :mod-wheel, :amount, :wave, :rate, :sync, :env-amt-2, :vca, :attack, :decay, :sustain, :release, :pattern, :play, :rate-2
  json.url patch_url(patch, format: :json)
end
