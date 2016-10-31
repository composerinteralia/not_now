class NotNow
  def self.call(blk)
    self.new.(blk)
  end

  def initialize
    @callbacks = []
  end

  def call(blk)
    blk.call(later)
    now
  end

  private
  attr_reader :callbacks

  def later
    @later ||= -> (callback) { callbacks.push(callback) }
  end

  def now
    until callbacks.empty?
      callbacks.shift.()
    end
  end
end
