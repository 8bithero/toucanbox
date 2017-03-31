class ContentChooser
  def initialize(boxes)
    @boxes = boxes
  end

  def call(users)
    users.reduce([]) do |results, user|
      results << {
        name: user[:name],
        available_boxes: boxes_available_to_user(user[:received_contents])
      }
    end
  end

  private
    def boxes_available_to_user(received_contents)
      results = []
      @boxes.each do |box|
        diff = received_contents - box[:contents]
        results << box[:code] if diff.size == received_contents.size
      end
      results
    end
end
