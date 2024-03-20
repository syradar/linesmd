import gleam/io
import argv
import v4

pub fn main() {
  case argv.load().arguments {
    [] -> io.println("Usage: linesmd <filename>")
    [filename] -> v4.linesmd(filename)
    _ -> io.println("Usage: linesmd <filename>")
  }
}
