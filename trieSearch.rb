class TrieNode
  def initialize
    @children = [nil] * 125
    @lastOfWord = false
  end

  def children
    @children
  end

  def setChildren(index, node)
    @children[index] = node
  end

  def lastOfWord 
    @lastOfWord
  end

  def setLastOfWord
    @lastOfWord = true
  end
end


class Trie
  def initialize
    @root = TrieNode.new
  end

  def getNode()
    TrieNode.new
  end

  def getCharIndex(k)
    k.to_s.ord - 'a'.ord
  end

  def insert(key)
    pCrawl = @root 

    key.each_char do |k|
      k_index = getCharIndex(k)
      if !pCrawl.children.index(k_index)
        pCrawl.children[k_index] = getNode()
      end

      pCrawl = pCrawl.children[k_index]
    end

    pCrawl.setLastOfWord
  end

  def search(key)
    pCrawl = @root

    key.each_char do |k|
      k_index = getCharIndex(k)

      if !pCrawl.children[k_index]
        return false
      end

      pCrawl = pCrawl.children[k_index]
    end

    pCrawl.lastOfWord
  end
end
