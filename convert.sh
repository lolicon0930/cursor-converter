#!/bin/bash
set -eu -o pipefail
[ -d outputs ] && rm -r outputs
mkdir -p outputs
cd outputs

if compgen -G "../inputs/*.ani" > /dev/null; then
	for name in ../inputs/*.ani; do
		name="$(basename "$name" .ani)"
		new_name="${name//[[:space:]]/_}"
		mkdir -p "$new_name"
		cd "$new_name"
		cp "../../inputs/$name.ani" "./$new_name.ani"
		../../ani2ico/ani2ico "$new_name.ani"
		rm "$new_name.ani"
		for f in *.ico; do
			filename="$(basename "$f")"
			png="${filename%.*}.png"
			convert "$f" "$png"
			identify -format '%w 1 1 %f 200\n' "$png" >> "$new_name.xcg"
		done
		xcursorgen "$new_name.xcg" "$new_name"
		cd ..
		echo "$new_name.ani convert complete."
	done
fi

if compgen -G "../inputs/*.cur" > /dev/null; then
	for name in ../inputs/*.cur; do
		name="$(basename "$name" .cur)"
		new_name="${name//[[:space:]]/_}"
		mkdir -p "$new_name"
		cd "$new_name"
		cp "../../inputs/$name.cur" "./$new_name.cur"
		convert "$new_name.cur" "$new_name.png"
		identify -format '%w 1 1 %f\n' "$new_name.png" >> "$new_name.xcg"
		xcursorgen "$new_name.xcg" "$new_name"
		cd ..
		echo "$new_name.cur convert complete."
	done
fi

cd ..
