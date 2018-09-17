//
//  FileManagement.swift
//  Project
//
//  Created by Sina on 9/17/18.
//  Copyright © 2018 SinaRan. All rights reserved.
//

import Foundation

struct FileManagement {
    static func writeOnFile(file:String,data:String){
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            
            do {
                try data.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {}
        }
    }
    static func readFromFile(file:String)->String? {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            do {
                let json = try String(contentsOf: fileURL, encoding: .utf8)
                return json
            }
            catch {}
        }
        return nil
    }
}
