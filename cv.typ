
// Imports
#import "@preview/brilliant-cv:2.0.4": cv
#import "SOT.typ": SOT, metadata
#let importModules(modules, lang: metadata.language) = {
  for module in modules {
    include {
      "modules_" + "en" + "/" + module + ".typ"
    }
  }
}


#show: cv.with(
  metadata,
  profilePhoto: image("./src/photo.png"),
)
#importModules((
  "education",
  "professional",
  "projects",
  "others",
  "certificates",
  "publications",
  "skills",
))
