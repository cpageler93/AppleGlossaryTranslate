//
//  AppleGlossaryTranslateTests.swift
//  AppleGlossaryTranslateTests
//
//  Created by Christoph Pageler on 27.01.21.
//


import XCTest
@testable import AppleGlossaryTranslate
import AppleGlossary


final class AppleGlossaryTranslateTests: XCTestCase {

    func testTranslateEnglishToOtherLanguage() {
        let german = AppleGlossaryTranslate().translate(englishText: "Photo Library", to: "de", catalog: nil)
        XCTAssertEqual(german, "Fotomediathek")

        let spanish = AppleGlossaryTranslate().translate(englishText: "Photo Library", to: "es", catalog: nil)
        XCTAssertEqual(spanish, "Fototeca")
    }

    func testTranslateOtherLanguageToOtherLanguage() {
        let spanish = "Fototeca"
        let german = AppleGlossaryTranslate().translate(text: spanish, from: "es", to: "de")
        XCTAssertEqual(german, "Fotomediathek")
    }

    func testPerformance() {
        let translate = AppleGlossaryTranslate()
        measure {
            XCTAssertNotNil(translate.translate(text: "Fotomediathek", from: "de", to: "es"))
            XCTAssertNotNil(translate.translate(text: "Letzte", from: "de", to: "es"))
            XCTAssertNotNil(translate.translate(text: "Verlauf", from: "de", to: "es"))
            XCTAssertNotNil(translate.translate(text: "Kein Ersatz gefunden", from: "de", to: "es"))
        }
    }

    static var allTests = [
        ("testTranslateEnglishToOtherLanguage", testTranslateEnglishToOtherLanguage),
        ("testTranslateOtherLanguageToOtherLanguage", testTranslateOtherLanguageToOtherLanguage),
        ("testPerformance", testPerformance)
    ]

}
