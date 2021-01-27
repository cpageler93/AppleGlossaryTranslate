# AppleGlossaryTranslate

Translate Values from Apple Glossaries.

## Example

### English to other language

```swift
let german = AppleGlossaryTranslate().translate(englishText: "Photo Library", to: "de", catalog: nil)
// german: Fotomediathek
```

### Language to Language

```swift
let spanish = "Fototeca"
let german = AppleGlossaryTranslate().translate(text: spanish, from: "es", to: "de")
// german: Fotomediathek
```
