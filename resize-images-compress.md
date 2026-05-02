```bash
sudo apt install imagemagick
```

```bash

mkdir -p out-compress

for file in *.png; do
    output_file="out-compress/${file%.png}_compress.png"
    convert "$file" -resize 50% -quality 80 "$output_file"
    echo "convert $file done!"
done
```

```bash
mkdir -p out-compress

for file in *.jpg; do
    output_file="out-compress/${file%.png}_compress.jpg"
    convert "$file" -resize 50% -quality 80 "$output_file"
    echo "convert $file done!"
done
```

===

## HEIC to JPG and compress

```bash
i=1
for f in *.HEIC; do
  printf -v name "YY%03d.jpg" "$i"

  tmp=$(mktemp --suffix=.jpg)

  if heif-convert "$f" "$tmp" >/dev/null 2>&1; then
    convert "$tmp" -quality 50 "$name"
    i=$((i+1))
  else
    echo "Skipping: $f"
  fi

  rm -f "$tmp"
done
```


```bash
sudo apt install jpegoptim 
```


jpegoptim --size=50% 1.jpg


sudo apt install imagemagick 

convert 1.jpg -quality 50 1_compressed.jpg

convert 1.jpg -resize 50% 1_resized.jpg


