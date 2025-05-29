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



```bash
sudo apt install jpegoptim 
```


jpegoptim --size=50% 1.jpg


sudo apt install imagemagick 

convert 1.jpg -quality 50 1_compressed.jpg

convert 1.jpg -resize 50% 1_resized.jpg


