defmodule MyList do
  def length(list) do
    length(list, 0) 
  end

  defp length([], count) do
    count
  end

  defp length([_|t], count) do
    length(t, count + 1)
  end

  def each([], _fun) do
    :ok
  end

  def each([h|t], fun) do
    fun.(h)
    each(t, fun)
  end

  def map(list, fun) do
    do_map(list, fun, [])
  end

  defp do_map([], _fun, acc) do
    :lists.reverse(acc)
  end

  defp do_map([h|t], fun, acc) do
    result = fun.(h)
    acc = [result | acc]
    do_map(t, fun, acc)
  end

  defp sum([], total) do
    total
  end

  defp sum([h|t], total) do
    sum(t, total + h)
  end

  @doc """
  Given a list of numbers, return the sum

  ## Parameters

  - `list` - a list of numbers in the form [1, 2, 3]


  ## Examples

      MyList.sum([1,2,3,4])
      10

  """ 
  def sum(list) do
    sum(list, 0)
  end

  defp reduce([], _fun, total) do
    total
  end

  defp reduce([h|t], fun, total) do
     result = fun.(h, total)
     reduce(t, fun, result)
  end

  @doc """
  Given a list, reduce each element and return the result

  ## Parameters

  - `list` - a list of numbers
  - `fun` - a function which will match against (element, total) and should return a reduced number

  ## Examples

      MyList.reduce([1,2,3,4], fn(n, total) -> :math.pow(n,2) + total end)
      30.0

  """
  def reduce(list, fun) do
    reduce(list, fun, 0)
  end

  defp do_reverse([], result) do
    result
  end

  defp do_reverse([h|t], result) do
    result = [h | result]
    do_reverse(t, result)
  end

  @doc """
  Given a list, reverse the elements and return the result

  ## Parameters

  - `list` - a list of elements

  ## Examples

      MyList.reverse([1,2,3,4,5])
      [5,4,3,2,1]
  """
  def reverse(list) do
    do_reverse(list, [])
  end
end

