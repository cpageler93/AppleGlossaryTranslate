//
//  AppleGlossaryTranslate.swift
//  AppleGlossaryTranslate
//
//  Created by Christoph Pageler on 27.01.21.
//


import AppleGlossary


public struct AppleGlossaryTranslate {

    private let glossary = AppleGlossary()

    public func translate(text: String, from: String, to: String, catalog: Catalog? = nil) -> String? {
        guard let fromLocale = Locale(rawValue: from) else { return nil }
        guard let toLocale = Locale(rawValue: to) else { return nil }
        let catalogs = searchInCatalogs(catalog)

        // convert from to english
        guard let fromTranslation = findTranslationSet(locale: fromLocale,
                                                       catalogs: catalogs,
                                                       value: text,
                                                       base: false)
        else {
            return nil
        }

        // convert english to "to"
        return findTranslationSet(locale: toLocale,
                                  catalogs: catalogs,
                                  value: fromTranslation.base.value,
                                  base: true)?.tran.value
    }

    public func translate(englishText text: String, to: String, catalog: Catalog?) -> String? {
        guard let toLocale = Locale(rawValue: to) else { return nil }
        let catalogs = searchInCatalogs(catalog)
        return findTranslationSet(locale: toLocale, catalogs: catalogs, value: text, base: true)?.tran.value
    }

    private func findTranslationSet(locale: Locale, catalogs: [Catalog], value: String, base: Bool) -> TranslationSet? {
        for catalog in catalogs {
            guard let project = glossary.project(locale: locale, catalog: catalog) else { continue }
            for file in project.files {
                for textItem in file.textItems {
                    if base && textItem.translationSet.base.value == value {
                        return textItem.translationSet
                    }
                    if !base && textItem.translationSet.tran.value == value {
                        return textItem.translationSet
                    }
                }
            }
        }
        return nil
    }

    private func searchInCatalogs(_ catalog: Catalog?) -> [Catalog] {
        if let catalog = catalog {
            return [catalog]
        } else {
            return Catalog.allCases
        }
    }

}
