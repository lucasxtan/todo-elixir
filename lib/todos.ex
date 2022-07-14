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

    for _ <- 1..number_of_tasks do
      IO.gets("Enter a Task: ") |> String.trim()
       # String.trim() removes trailing whitespace like \n
    end
  end

  # create list, aka enumerable in elixir
  def temp_todos do
    ["eat apple", "read book", "elixir series", "exercise"]
  end

  def complete_todo(tasks, task) do
    if contains?(tasks, task) do
      # execute this block
      List.delete(tasks, task)
    else
      # otherwise execute this block
      :not_found_error
    end
  end

  def add_new_todo(tasks, task) do
    List.insert_at(tasks, -1, task)
  end

  def contains?(tasks, task) do
    Enum.member?(tasks, task)
  end

  #search task
  def keyword_search(tasks, word) do
    for task <- tasks, String.contains?(task, word) do
      task
    end
  end

  def random_task(tasks) do
    [task] = Enum.take_random(tasks, 1)
    task
  end

  def save(tasks, filename) do
    # invoking erlang code
    # converting our list so that it can be written to our file system
    binary = :erlang.term_to_binary(tasks)
    File.write(filename, binary)
  end

  def read(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist"
    end
    # {_status, binary} = File.read(filename)
    # :erlang.binary_to_term(binary)
  end


end
