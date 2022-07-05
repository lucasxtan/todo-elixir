defmodule Todos do
  def create_todos do
    number_of_tasks = IO.gets("Enter the number of tasks you want to add: ")
    {number_of_tasks, _q} = Integer.parse(number_of_tasks)
    number_of_tasks
  end
end
