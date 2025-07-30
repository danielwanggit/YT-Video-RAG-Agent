#!/usr/bin/python3
import sys
import json
import yt_dlp

def search_youtube(query, max_results):
    ydl_opts = {
        'quiet': True,
        'skip_download': True,
        'extract_flat': True,
        'force_generic_extractor': False,
    }

    search_url = f"ytsearch{max_results}:{query}"

    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        result = ydl.extract_info(search_url, download=False)
        return [
            {
                "title": entry.get("title"),
                "url": entry.get("url"),
                "id": entry.get("id"),
                "duration": entry.get("duration"),
                "uploader": entry.get("uploader"),
            }
            for entry in result.get("entries", [])
        ]

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python youtube_search.py <search query>")
        sys.exit(1)

    query = sys.argv[1]
    n = sys.argv[2]
    videos = search_youtube(query, n)
    print(json.dumps(videos, indent=2, ensure_ascii=False))

