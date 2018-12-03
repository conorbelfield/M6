define :test do
  use_synth :prophet
  play 70, release: 0.4
  sleep(0.5)
  play 60, release: 0.4
end

define :drums do
  live_loop :drum_snare do
    sample :drum_snare_soft
    sleep(1)
  end
  live_loop :drum_bass do
    sync :drum_snare
    sample :drum_bass_hard
    sleep(0.5)
    sample :drum_bass_hard
    sleep(0.5)
  end
end

define :melody do
  live_loop :piano do
    use_synth :piano
    play (scale :c4, :augmented, num_octaves:2).choose
    play (scale :c3, :augmented, num_octaves:2).choose
    play (scale :c2, :augmented, num_octaves:2).choose
    sleep(knit 0.5, 4, 0.75, 2, 1, 1, 0.25, 4).choose
  end
  live_loop :bass do
    synth :blade
    play :e3, sustain: 2, amp: 0.5
    sleep(knit 8, 2, 4, 1).choose
  end
  
  live_loop :accompany do
    sync :piano
    synth :dull_bell
    play (ring 1, 1, 3, 3, 1, 3, :c4).choose
    sleep(0.5)
  end
end
melody
drums
