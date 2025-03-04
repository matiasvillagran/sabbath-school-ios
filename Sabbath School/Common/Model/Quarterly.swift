/*
 * Copyright (c) 2017 Adventech <info@adventech.io>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Unbox

struct Quarterly {
    
    static func ==(lhs: Quarterly, rhs: Quarterly) -> Bool {
        return lhs.id == rhs.id && lhs.index == rhs.index
    }
    
    let id: String
    let title: String
    let description: String
    let humanDate: String
    let startDate: Date
    let endDate: Date
    let cover: URL
    let colorPrimary: String?
    let colorPrimaryDark: String?
    let index: String
    let path: String
    let fullPath: URL
    let lang: String
}

extension Quarterly: Unboxable {
    init(unboxer: Unboxer) throws {
        id = try unboxer.unbox(key: "id")
        title = try unboxer.unbox(key: "title")
        description = try unboxer.unbox(key: "description")
        humanDate = try unboxer.unbox(key: "human_date")
        startDate = try unboxer.unbox(key: "start_date", formatter: Date.serverDateFormatter())
        endDate = try unboxer.unbox(key: "end_date", formatter: Date.serverDateFormatter())
        cover = try unboxer.unbox(key: "cover")
        colorPrimary = try? unboxer.unbox(key: "color_primary")
        colorPrimaryDark = try? unboxer.unbox(key: "color_primary_dark")
        index = try unboxer.unbox(key: "index")
        path = try unboxer.unbox(key: "path")
        fullPath = try unboxer.unbox(key: "full_path")
        lang = try unboxer.unbox(key: "lang")
    }
}
