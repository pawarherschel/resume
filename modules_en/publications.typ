
// Imports
#import "@preview/brilliant-cv:2.0.4": cvSection, cvPublication
#import "../SOT.typ": publications, get-or-none, metadata

#let cvSection = cvSection.with(metadata: metadata)

#if publications != none {
  let bib-path = get-or-none(publications, "bibPath")
  let ref-style = get-or-none(publications, "refStyle")
  let key-list = get-or-none(publications, "key-list")

  if bib-path != none and bib-path != "" {
    if key-list == () {
      panic("keyList is empty")
    }
    cvSection("Publications")
    cvPublication(
      bib: bibliography(bib-path),
      keyList: key-list,
      refStyle: ref-style,
    )
  }
}
