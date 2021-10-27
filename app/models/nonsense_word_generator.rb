class NonsenseWordGenerator
  STARTING_CONSONANTS = %w(
      b c d f g h j k l m n p r s t v w y z bl br ch cl cr dr fl fr gh gl gn gr kn ph pl pr qu sc sh sk sl sm sn sp st th tr wh wr sch scr shm shr squ str thr
  ).freeze
  VOWEL_GROUPS = %w(
      a e i o u ae ai ao au ea ee ei eu ia ie io oa oe oi oo ou ue ui
  ).freeze
  ENDING_CONSONANTS = %w(
      b c d f g l m n p r s t x z bt ch ck ct ft gh gn lb ld lf lk ll lm ln lp lt mb mn mp nk ng nt ph pt rb rc rd rf rg rk rl rm rn rp rt rv rz sh sk sp ss st zz lch lsh lth rch rsh rst rth sch tch
  ).freeze

  def initialize
  end

  def self.generate_nonsense_word
    return case rand(1..100)
    when 1..75
      generate_syllable
    when 76..95
      generate_syllable + generate_syllable
    when 96..100
      generate_syllable + generate_syllable + generate_syllable
    else
      ''
    end
  end

  private

  def self.generate_syllable
    return case rand(1..3)
    when 1
      STARTING_CONSONANTS.sample + VOWEL_GROUPS.sample + ENDING_CONSONANTS.sample
    when 2
      VOWEL_GROUPS.sample + ENDING_CONSONANTS.sample
    when 3
      STARTING_CONSONANTS.sample + VOWEL_GROUPS.sample
    else
      ''
    end
  end
end
