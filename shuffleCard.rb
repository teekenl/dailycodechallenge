def random_number(k)
  rand(k + 1)
end

def shuffle_card()
  num_of_cards
  cards = (1..num_of_cards).to_a

  0.upto(cards.size).each do |old_pos|
    new_pos = old_pos + random_number(card_size - old_pos - 1)
    temp = cards[new_pos]
    cards[new_pos] = cards[old_pos]
    cards[old_pos] = temp
  end

  cards
end