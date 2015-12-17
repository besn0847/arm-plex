# arm-plex

To start the container with default config :
```bash
docker run -d --net="host" arm-plex
```

But you can also use your local datastore :
```bash
docker run -d --net="host" -v <your local datastore>:/data arm-plex
```

WARNING: The Raspberry Pi 2 is very CPU limited so there is no on-the-fly transcoding possible. If you want to cast to Chromecast make sure this is the right format by transcoding the movie ahead. 

Here is a sample on how to transcode :
```bash
ffmpeg -i <MyMovie.mpg> -y -f mp4 -acodec aac -ab 192k -ac 2 -absf aac_adtstoasc -async 1 -vcodec libx264 -vsync 0 -profile:v main -level 3.1 -qmax 22 -qmin 20 -x264opts no-cabac:ref=2 -threads 0 -strict -2 <MyMovie.mp4>
```
