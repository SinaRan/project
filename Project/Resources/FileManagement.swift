//
//  FileManagement.swift
//  Project
//
//  Created by Sina on 9/17/18.
//  Copyright © 2018 SinaRan. All rights reserved.
//

import Foundation

struct FileManagement {
    
    /// This function writes a given data to a given file name.
    ///
    /// - Parameters:
    ///   - file: File name which data shoyld writ into.
    ///   - data: Data which write into the given file name.
    static func writeOnFile(file:String,data:String){
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            
            do {
                try data.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {}
        }
    }
    
    /// This function returns a file's data if available.
    ///
    /// - Parameter file: A file name which reads data from.
    /// - Returns: An optional string which is file data.
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
