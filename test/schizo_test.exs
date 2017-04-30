defmodule SchizoTest do
  use ExUnit.Case
  doctest Schizo

  test "uppercase doesn't change the first word" do
    assert (Schizo.uppercase("foo") == "foo")
  end

  test "uppercase converts second word to uppercase" do
    assert (Schizo.uppercase("hello world") == "hello WORLD")
  end 

  test "uppercase converts every other word to uppercase" do
    assert (Schizo.uppercase("the lord of the rings") == "the LORD of THE rings")
  end

  test "unvowel doesn't change the first word" do
    assert (Schizo.unvowel("foo") == "foo")
  end

  test "unvowel removes second word's vowel's" do
    assert (Schizo.unvowel("hello world") == "hello wrld")
  end 

  test "unvowel removes every other words vowel" do
    assert (Schizo.unvowel("the lord of the rings") == "the lrd of th rings")
  end    
end
