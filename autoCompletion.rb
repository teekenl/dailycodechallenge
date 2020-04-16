class TrieNode
  attr_accessor  :children, :last
  def initialize
    @children = {}
    @last = false
  end
end

class Trie
  def initialize
    @root = TrieNode.new
    @word_list = []
  end

  def insert_all(keys)
    keys.each do |key|
      insert(key)
    end
  end

  def insert(key)
    node = @root
    key.each_char do |k|
      if !node.children[k]
        node.children[k] = TrieNode.new
      end

      node = node.children[k]
    end

    node.last = true
  end

  def search(key)
    node = @root
    found = true

    key.each_char do |k|
      if !node.children[k]
        found = false
        break
      end
      node = node.children[k]
    end

    return node.last && found
  end

  def suggestions(node, word)
    if node.last
      @word_list << word
    end

    node.children.each do |(key, child)|
      suggestions(child, word + key)
    end
  end
  
  def suggestions_lists(key)
    node = @root
    temp_word = ""
    found = true

    key.each_char do |k|
      if !node.children[k]
        found = false
        break;
      end

      temp_word += k
      node = node.children[k]
    end

    if !found
      return []
    end

    suggestions(node, temp_word)
    return @word_list
  end 
end

def auto_completion(words, target)
  t = Trie.new
  t.insert_all(words)

  t.suggestions_lists(target)
end
