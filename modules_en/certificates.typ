
// Imports
#import "@preview/brilliant-cv:2.0.4": cvSection, cvHonor
#import "../SOT.typ": metadata, certificates

#let cvSection = cvSection.with(metadata: metadata)
#let cvHonor = cvHonor.with(metadata: metadata)

#if certificates != none {
  cvSection("Certificates")

  for (
    date,
    title,
    issuer,
    url,
    location,
  ) in certificates {
    cvHonor(
      date: date,
      title: title,
      issuer: issuer,
      url: url,
      location: location,
    )
  }
}
