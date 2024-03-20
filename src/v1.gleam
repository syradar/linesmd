import gleam/io
import gleam/int
import gleam/list
import gleam/string
import gleam/result
import simplifile

pub fn linesmd(filename) {
  io.println("linesmd v1 - print the number of non-empty lines")
  print_line_count(filename)
}

fn print_line_count(filename: String) {
  let contents = simplifile.read(from: filename)

  contents
  |> result.map(print_lines)
  |> result.map_error(get_simplifile_error_message)
  |> result.unwrap_both
  |> io.println
}

fn print_lines(contents: String) -> String {
  string.split(contents, "\n")
  |> list.filter(is_not_empty_or_whitespace)
  |> list.length
  |> get_line_count_message
}

fn is_not_empty_or_whitespace(line: String) -> Bool {
  let trimmed = string.trim(line)
  case trimmed {
    "" -> False
    _ -> True
  }
}

fn get_line_count_message(count: Int) {
  "Number of lines: " <> int.to_string(count)
}

fn get_simplifile_error_message(error: simplifile.FileError) -> String {
  case error {
    _ -> "Failed to read file"
  }
}
