defmodule Schizo do
  @moduledoc """
  A nice library that lets you uppercase or unvowel every other word in the sentence
  """

  @doc """
    Takes a string and transforms every other word to uppercase

    ## Examples

      iex> Schizo.uppercase("hello world")
      "hello WORLD"

      iex> Schizo.uppercase("Lord of the flies")
      "Lord OF the FLIES"
  """
  def uppercase(str) do
    transform_every_other_word(str, &upper_caser/1)
  end

  @doc """
    Takes a string and removes every other word's vowel

    ## Examples

      iex> Schizo.unvowel("hello world")
      "hello wrld"

      iex> Schizo.unvowel("Lord of the flies")
      "Lord f the fls"
  """
  def unvowel(str) do
    transform_every_other_word(str, &unvoweler/1)
  end

  defp transform_every_other_word(str, transformation) do
    str
    |> String.split(" ")
    |> Stream.with_index
    |> Enum.map(transformation)
    |> Enum.join(" ")    
  end

  defp upper_caser(input) do
    transformer(input, &String.upcase/1)
  end

  defp unvoweler(input) do
    transformer(input, fn (word) -> Regex.replace(~r([aeiou]), word, "") end)
  end

  defp transformer({word, index}, transformation) do
    cond do
      rem(index, 2) == 0 -> word
      rem(index, 2) == 1 -> transformation.(word)
    end
  end
end
