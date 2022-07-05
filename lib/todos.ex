defmodule Todos do
  #todo - complete later
  def create_todos do
    # old code
    # number_of_tasks = IO.gets("Enter the number of tasks you want to add: ") # {3, \n}
    # {number_of_tasks, _q} = Integer.parse(number_of_tasks)
    #the _ in front of q makes elixir know we're not looking at it or using it, otherwise elixir complains we're not using it
    # number_of_tasks

    # new code - pipe operator |>
    # The pipe operator passes the result of an expression as the first parameter of another expression
    {number_of_tasks, _} = IO.gets("Enter the number of tasks you want to add: ") |> Integer.parse()
    number_of_tasks
  end

  # create list, aka enumerable in elixir
  def temp_todos do
    ["eat apple", "read book", "elixir series", "exercise"]
  end

  def contains?(tasks, task) do
    Enum.member?(tasks, task)
  end

  def keyword_search(tasks, word) do
    for task <- tasks, String.contains?(task, word) do
      task
    end
  end

  def random_task(tasks) do
    [task] = Enum.take_random(tasks, 1)
    task
  end

end
