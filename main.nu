#!/usr/bin/env nu

def main [file: string] {
  let file = $file | path expand -n
  let auxl = ".aux"

  cp $file $auxl
  rm $file
  mv $auxl $file
}
