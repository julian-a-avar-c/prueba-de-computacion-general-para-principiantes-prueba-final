#import "@preview/g-exam:0.4.2": *

#let data = json("./data.json")

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
  ),

  show-student-data: "first-page",
  show-grade-table: false,
  // clarifications: "Responda las preguntas en los espacios proporcionados."
)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 2em,
  row-gutter: 1pt,
  ..data.preguntas.map((pregunta) => [
    #question(points: pregunta.puntaje)[#pregunta.titulo]
    #enum(
      numbering: "a)",
      ..pregunta.respuestas
    )
    #solution(rotate(180deg, pregunta.respuesta))
  ])
)
