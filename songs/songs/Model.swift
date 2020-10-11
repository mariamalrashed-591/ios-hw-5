//
//  Model.swift
//  songs
//
//  Created by Mariam on 10/9/20.
//

import Foundation


struct Category {
    let artistName: String
    let artistImage: String
    let songs : [Song]
}

struct Song{
    let songName: String
    let songImage: String
    let audioName: String
}

let data: [Category] = [
    Category(artistName: "راشد الماجد", artistImage: "rashed", songs: rashed),
    Category(artistName: "عبدالمجيد عبدالله", artistImage: "majeed", songs: majeed),
    Category(artistName: "ماجد المهندس", artistImage: "majed", songs: majed),
    Category(artistName: "فضل شاكر", artistImage: "fadhel", songs: fadhel)
]

let rashed: [Song] = [
    Song(songName: "ولهان", songImage: "rashed1",audioName: "rashed1"),
    Song(songName: "كذاب", songImage: "rashed2",audioName: "rashed2")
]

let majeed: [Song] = [
    Song(songName: "ما كان هذا حب", songImage: "majeed1",audioName: "majeed1"),
    Song(songName: "حن الغريب", songImage: "majeed2", audioName: "majeed2")
]
let majed: [Song] = [
    Song(songName: "يهزك الشوق", songImage: "majed1", audioName: "majed1"),
    Song(songName: "هدوء", songImage: "majed2", audioName: "majed2")
]
let fadhel: [Song] = [
    Song(songName: "لو على قلبي", songImage: "fadhel1", audioName: "fadhel1"),
    Song(songName: "غيب", songImage: "fadhel2", audioName: "fadhel2")
]

