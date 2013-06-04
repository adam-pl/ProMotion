class TestTableScreen < ProMotion::SectionedTableScreen

  def promotion_table_data
    @promotion_table_data
  end

  def on_load
    @tap_counter ||= 0
  end

  def table_data
    @data ||= [{
      title: "Your Account",
      cells: [
        { title: "Increment", action: :increment_counter_by, arguments: { number: 3 } },
        { title: "Add New Row", action: :add_tableview_row },
        { title: "Delete the row below", action: :delete_cell, arguments: {section: 0, row:3 } },
        { title: "Just another blank row" },
        { title: "Delete the row below with an animation", action: :delete_cell, arguments: {animated: true, section: 0, row:5 } },
        { title: "Just another blank row" }
      ]
    }, {
      title: "App Stuff",
      cells: [
        { title: "Increment One", action: :increment_counter },
        { title: "Feedback", remote_image: { url: "http://placekitten.com/100/100", placeholder: "some-local-image", size: 50, radius: 15 } }
      ]
    }, {
      title: "Image Tests",
      cells: [
        { title: "Image Test 1", image: {image: UIImage.imageNamed("list.png"), radius: 10} },
        { title: "Image Test 2", image: {image: "list.png"} },
        { title: "Image Test 3", image: UIImage.imageNamed("list.png") },
        { title: "Image Test 4", image: "list.png" },
      ]
    }]
  end

  def edit_profile(args={})
    args[:id]
  end

  def add_tableview_row(args={})
    @data[0][:cells] << {
      title: "Dynamically Added"
    }
    update_table_data
  end

  def delete_cell(args={})
    if args[:animated]
      delete_row(NSIndexPath.indexPathForRow(args[:row], inSection:args[:section]))
    else
      @data[args[:section]][:cells].delete_at args[:row]
      update_table_data
    end
  end

  def increment_counter(args={})
    @tap_counter += 1
  end

  def increment_counter_by(args={})
    @tap_counter = @tap_counter + args[:number]
  end

  def tap_counter
    @tap_counter
  end


end