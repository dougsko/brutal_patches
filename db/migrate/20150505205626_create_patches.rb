class CreatePatches < ActiveRecord::Migration
  def change
    create_table :patches do |t|
      t.string :title
      t.text :description
      t.string :sub_fifth
      t.string :overtone
      t.string :ultra_saw
      t.string :saw
      t.string :pulse_width
      t.string :square
      t.string :metalizer
      t.string :triangle
      t.string :cutoff
      t.string :mode
      t.string :resonance
      t.string :env_amt
      t.string :brute_factor
      t.string :kbd_tracking
      t.string :modmatrix
      t.string :octave
      t.string :volume
      t.string :glide
      t.string :mod_wheel
      t.string :amount
      t.string :wave
      t.string :rate
      t.string :sync
      t.string :env_amt_2
      t.string :vca
      t.string :attack
      t.string :decay
      t.string :sustain
      t.string :release
      t.string :pattern
      t.string :play
      t.string :rate_2

      t.timestamps null: false
    end
  end
end
