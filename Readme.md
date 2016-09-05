# Magnet Test

## Install Coocapods

`sudo gem install cocoapods --version 1.0.1`

See more at: https://cocoapods.org/

## Install pods

At the root folder of the project, run:

`pod install`

## Open project

Open the workspace created by cocoapods:

`open Magnet\ Movies.xcworkspace/`

## Reference Video

Check `test.mov` as a video reference

## Extra info

This is an example of a movie object:

```json
{
    poster_path: "/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg",
    adult: false,
    overview: "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
    release_date: "1994-09-10",
    genre_ids: [
        18,
        80
    ],
    id: 278,
    original_title: "The Shawshank Redemption",
    original_language: "en",
    title: "The Shawshank Redemption",
    backdrop_path: "/xBKGJQsAIeweesB79KC89FpBrVr.jpg",
    popularity: 5.753941,
    vote_count: 5255,
    video: false,
    vote_average: 8.32
}
```

If you want to get the poster's image, take the `poster_path` and prepend this path:

`http://image.tmdb.org/t/p/w185`

So the full image's path is:

`http://image.tmdb.org/t/p/w185/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg`
