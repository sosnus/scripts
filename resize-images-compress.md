```bash
sudo apt install imagemagick
```

```bash
for file in *.png; do
    convert "$file" -resize 50% -quality 80 "${file%.png}_compress.png"
done
```

======



```bash
sudo apt install jpegoptim 
```


jpegoptim --size=50% 1.jpg


sudo apt install imagemagick 

convert 1.jpg -quality 50 1_compressed.jpg

convert 1.jpg -resize 50% 1_resized.jpg


