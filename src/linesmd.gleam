import gleam/io
import argv
import v3

pub fn main() {
  case argv.load().arguments {
    [] -> io.println("Usage: linesmd <filename>")
    [filename] -> v3.linesmd(filename)
    _ -> io.println("Usage: linesmd <filename>")
  }
}
