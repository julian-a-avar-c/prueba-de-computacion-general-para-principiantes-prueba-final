#import "@preview/g-exam:0.4.2": *
// #import "@preview/suiji:0.4.0": *

#let data = json("./data.json")

// #let randomize(options) = {
//   context {
//     let _rng = none
//     let _options = none
//     (_rng, _options) = shuffle(rng.get(), options)
//     rng.update(_rng)
//     _options.join(",")
//   }
// }

#show: exam.with(
  school: (
    name: data.org,
    // logo: read("./logo.png", encoding: none),
  ),
  exam-info: (
    academic-period: "2025",
    academic-level: "Curso Basico",
    academic-subject: "Computacion",
    number: "1",
    content: "Final",
    // model: "Model A"
  ),

  show-student-data: "first-page",
  show-grade-table: false,
  clarifications: "Responda las preguntas en los espacios proporcionados."
)

#data.secciones.map((seccion) => [
  #heading(seccion.nombre)

  #grid(
    columns: (1fr, 1fr),
    gutter: (2em, 1em),
    ..seccion.preguntas.map((pregunta) => [
      #question(points: pregunta.puntaje)[#pregunta.pregunta]
      #enum(
        numbering: "a)",
        ..pregunta.opciones
      )
      #solution(rotate(180deg, pregunta.respuesta_correcta))
    ])
  )
]).join(v(1em))
