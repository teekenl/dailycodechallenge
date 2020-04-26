class BinaryTree
  attr_accessor :locked_descendants

  def initialize(value, parent)
    @value = value
    @parent = parent
    @locked_descendants = 0
    @locked = false
  end

  def unlock
    return true if !self.locked

    if self.restricted?
      return false
    else
      self.locked = false
      update_parent(toggle_lock = false)
      return true
    end
  end

  def lock
    return true if self.locked

    if self.restricted?
      return false
    else
      self.locked = true
      update_parent(toggle_lock = true)
      return true
    end
  end

  def locked
    @locked
  end

  def parent
    @parent
  end

  def locked=(lock)
    @locked = lock
  end

  def is_parent_locked
    return false if !self.parent
    return true if self.parent.locked

    is_parent_locked(self.parent)
  end

  def update_parent(toggle_lock)
    locked_descendant_count = toggle_lock == true ? 1 : -1

    if self.parent
      self.parent.locked_descendants += locked_descendant_count
      update_parent(self.parent, toggle_lock)
    end
  end

  def restricted?
    is_parent_locked || self.locked_descendants > 0
  end
end