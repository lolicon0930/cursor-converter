# Windows to Linux cursor converter

## Depends

- ImageMagick
- Windows Cursors, either `.ani` or `.cur`.

## If you want to build ani2ico yourself

```
cd ani2ico
rm ani2ico
make
strip ani2ico
```

## Conversion

Input files should be in `inputs/*.ani` and `inputs/*.cur`
Output files will go to `outputs/CURSORNAME/CURSORNAME*`

```
./convert.sh
```

## Usage

Start with a default cursor theme, something like Adwaita

```
mkdir -p ~/.icons/THEMENAME
cp /usr/share/icons/Adwaita/cursors ~/.icons/THEMENAME
```

Replace the cursors you want

```
cp outputs/CURSORNAME/CURSORNAME ~/.icons/THEMENAME/cursors/CURSOR_TO_REPLACE
```

You may also have to select the cursor theme.
In Gnome, this is done using `gnome-tweak-tool`, in `Appearance/Themes/Cursor` select `THEMENAME`.
