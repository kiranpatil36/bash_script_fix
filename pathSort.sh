#!/usr/bin/env bash

a=(
  "C:\Test Path One"
  "/test path two"
  "/test_path_three"
  "/tmp/testpath4"
  "/private/tmp/test path 5"
  "G:\test\path\six"
)

for i in "${a[@]}"; do
  if [[ $i =~ ^[A-Z]:\\ ]]; then
    windowsPaths="$windowsPaths
$i"
  else
    unixPaths="$unixPaths
$i"
  fi
done

echo "$windowsPaths" | while read line; do
  w="$w
This is a windows path: $line"
done

echo "$unixPaths" | while read line; do
  u="$u
This is a unix path: $line"
done

echo "$w"
echo "$u"
