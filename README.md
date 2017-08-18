```bash
ffmpeg -i videos/VIDEO_A frames/A_%4d.jpg
```
```bash
ffmpeg -i videos/VIDEO_B frames/B_%4d.jpg
```
```bash
./mixer.sh -i frames -o mixed
```
```bash
ffmpeg -r 30 -i mixed/AB_%4d.jpg -qscale 0 -pix_fmt yuv420p resultado_final.mp4
```
