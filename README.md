# SquaringTheCircle

A video came across my facebook feed with an art piece. 

http://trendland.com/troika-squaring-the-circle/

I wondered how it was made, and wrote some matlab code to investigate. 

Turns out it's parabolas!

Here are the results of the code:

In colour:
https://www.youtube.com/watch?v=9S1gCIHZkDY

B&W:
https://www.youtube.com/watch?v=LrqmgD3Lvs8


FFMPEG was used to dump the video to images to more easily work with:
ffmpeg -i circle.mp4 -r 5 -f image2 png\IMG%%04d.png


