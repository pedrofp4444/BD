#let index = {
  show outline: it => {
      show heading: set text(size: 18pt)
      it
  }

  {
    show outline.entry.where(level: 1): it => {
      v(5pt)
      strong(it)
    }

    outline(
      title: [Índice], 
      indent: true, 
    )
  }

  v(-0.4em)
  outline(
    title: none,
    target: figure.where(kind: "attachment"),
    indent: n => 1em,
  )

  outline(
    title: [Lista de Figuras],
    target: figure.where(kind: image),
  )

  outline(
    title: [Lista de Tabelas],
    target: figure.where(kind: table),
  )
}
