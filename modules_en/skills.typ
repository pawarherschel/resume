
// Imports
#import "@preview/brilliant-cv:2.0.4": cvSection, cvSkill, hBar
#import "../SOT.typ": metadata, skills, get-or-none

#let cvSection = cvSection.with(metadata: metadata)

#if skills != none {
  cvSection("Skills")

  for skill in skills {
    let visible = get-or-none(skill, "visible") != false
    if not visible { continue }

    let info = get-or-none(skill, "info")
    let type = get-or-none(skill, "type")

    let info = info.join(hBar())

    cvSkill(
      type: type,
      info: info,
    )
  }
}
