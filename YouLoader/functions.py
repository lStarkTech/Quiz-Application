import yt_dlp

def download_video_audio(video_url, options):
    try:
        with yt_dlp.YoutubeDL(options) as ydl:
            ydl.download([video_url])
        
    except Exception as e:
        return e
    
