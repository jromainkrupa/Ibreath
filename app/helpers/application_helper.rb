module ApplicationHelper
  def color_class_for_program(program, value)
    step = (value / (program.max / 9.0)).ceil
    p "max: #{program.max}, value: #{value}, step: #{step}"
    "bg-green-#{step}00"
  end
end
