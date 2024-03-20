//// Reads files and printw non-empty lines ⭐️

import gleam/io
import gleam/int
import gleam/list
import gleam/bool
import gleam/string
import simplifile.{read}

pub fn linesmd(filename: String) {
  io.println("linesmd v4 - print the number of non-empty lines")

  let message = case read(from: filename) {
    Ok(contents) -> get_non_empty_lines(contents)
    Error(_) -> "Failed to read file"
  }

  io.println(message)
}

fn get_non_empty_lines(contents: String) -> String {
  string.split(contents, "\n")
  |> list.map(string.trim)
  |> list.filter(not_empty)
  |> list.length
  |> get_line_count_message
}

fn not_empty(trimmed: String) -> Bool {
  string.is_empty(trimmed)
  |> bool.negate
}

fn get_line_count_message(count: Int) {
  "Number of lines: " <> int.to_string(count)
}
