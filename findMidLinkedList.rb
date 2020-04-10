def findMiddleLinkList(node)
  middle = head
  count = 1

  while(node.next != nil)
    if (count % 2 != 0)
      middle = middle.next
    end

    node = node.next
    count += 1
  end

  middle
end



