require_relative "testing_library"

def hamming(strand_1, strand_2)
  sum = 0
  if (strand_1.length != strand_2.length) && (strand_1.length < strand_2.length)
    len = strand_1.length - 1
  elsif
    (strand_1.length != strand_2.length) && (strand_1.length > strand_2.length)
    len = strand_2.length - 1
  else
    len = strand_1.length
  end

  (0..len).each do |num|
    if strand_1[num] != strand_2[num]
      sum +=1
    end
  end
  sum
end

check("Hamming distance between identical strands",
      hamming("A", "A") == 0)

check("Hamming distance for single nucleotide strand",
      hamming("A", "G") == 1)

check("Hamming distance between small strands",
      hamming("AG", "CT") == 2)

check("Hamming distance between two other small strands",
      hamming("AT", "CT") == 1)

check("Hamming distance in longer strands",
      hamming("GGACG", "GGTCG") == 1)

check("Ignoring extra length in the first strand when it's longer",
      hamming("AAAG", "AAA") == 0)

check("Ignoring extra length in the second strand when it's longer",
      hamming("AAA", "AAAG") == 0)