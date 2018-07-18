//
//  DoubanNetworkService.swift
//  NewPorject
//
//  Created by idea on 2018/4/25.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ObjectMapper

class DoubanNetworkService: NSObject {

    
    //获取频道数据
    func loadChannels() -> Observable<[Channel]> {
        return ApiProvider.rx.request(.channels)
            .mapObject(Douban.self)
            .map{ $0.channels ?? [] }
            .asObservable()
    }
    
    //获取歌曲列表数据
    func loadPlaylist(channelId:String) -> Observable<Playlist> {
        return ApiProvider.rx.request(.playlist(channelId))
            .mapObject(Playlist.self)
            .asObservable()
    }
    
    //获取频道下第一首歌曲
    func loadFirstSong(channelId:String) -> Observable<Song> {
        return loadPlaylist(channelId: channelId)
            .filter{ $0.song.count > 0}
            .map{ $0.song[0] }
    }
}
