def interset_linked_list(list1, lists2)
  return -1 if !list1 || !lists2

  while(list1 && list2)
    if lists1.val == list2.val
      return list1.val
    end
    list1 = list1.next
    list2 = list2.next
  end

  -1
end