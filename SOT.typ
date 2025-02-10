#let SOT = toml("SOT.toml")

#let metadata = toml(SOT.metadata)

#let get-or-none(dict, key) = if dict.keys().contains(key) {
  dict.at(key)
} else {
  none
}

#let certificates = get-or-none(SOT, "certificates")
#let education = get-or-none(SOT, "education")
#let projects = get-or-none(SOT, "projects")
#let others = get-or-none(SOT, "others")
#let skills = get-or-none(SOT, "skills")
#let publications = get-or-none(SOT, "publications")

#let metaCVEntry(key, section-title) = {
  import "@preview/brilliant-cv:2.0.4": cvSection, cvEntry, hBar

  let cvSection = cvSection.with(metadata: metadata)
  let cvEntry = cvEntry.with(metadata: metadata)

  let arr = get-or-none(SOT, key)

  if arr != none {
    let arr = arr.filter(e => get-or-none(e, "visible") != false)
    if arr.len() == 0 {
      return
    }

    cvSection(section-title)

    for entry in arr {
      let title = get-or-none(entry, "title")
      let society = get-or-none(entry, "society")
      let date = get-or-none(entry, "date")
      let location = get-or-none(entry, "location")
      let logo = get-or-none(entry, "logo")
      let description = get-or-none(entry, "description")
      let tags = get-or-none(entry, "tags")
      let preview = get-or-none(entry, "preview")

      // preview     = "https://r2.sakurakat.systems/covuni-experience-banner.jpg"

      if type(location) == dictionary {
        if location.keys().contains("github") {
          location = link("https://github.com/" + location.github)
        } else { panic("unknown location") }
      } else {
        none
      }

      let description = if description != () {
        description.map(line => [- #line]).join()
      } else { none }

      let logo = if logo != none and logo != () {
        image(logo)
      } else { "" }

      let tags = if tags != none {
        tags
      } else { () }

      if logo == "" and preview != none {
        logo = align(center)[#link(preview)[🔗]]
      }

      cvEntry(
        title: title,
        society: society,
        date: date,
        location: location,
        description: description,
        metadata: metadata,
        logo: logo,
        tags: tags,
      )
    }
  }
}
