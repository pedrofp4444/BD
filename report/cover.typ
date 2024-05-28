#let blue = rgb("365F91")
#let gray = rgb("808080")
#let light_gray = rgb("A6A6A6")

#let cover(title: "", authors: (), string_date) = {
  let render_authors = grid(columns: authors.len(),
                            column-gutter: 15pt,
                            ..authors.map(it => [
                              #text(size:12pt, weight: "bold", it.name) \
                              #text(size: 11pt, it.number)
                            ])
                           )
                           
  {
    set page(paper: "a4", margin: (x: 0cm,y: 0cm))
    
    rect(fill: blue,height: 100%, width:23.3%)
    
    place(bottom + left,dx: 59pt,dy:-40pt, {
      text(weight:"bold", size: 120pt, fill: white, [B])
      text(weight:"bold", size: 120pt, fill: blue, [D])
    })
  
    {
      set place(top+left, dx: 200pt)
      place(dy: 120pt, image("images/uminho.png", height: 8%))
      place(dy: 200pt, {
        text(size: 10pt, weight: "bold", fill: gray, [Universidade do Minho\ ])
        text(size: 9pt, fill: gray, [Escola de Engenharia\ Licenciatura em Engenharia Informática\ ])
      })
      place(dy: 300pt, {
  
        text(size: 20pt, fill: blue, weight: "bold", [Unidade Curricular de \ Base de Dados\ ])
        text(size: 10pt, [Ano Letivo de 2023/2024])
      })
      place(dy: 520pt, text(size: 20pt, weight: "bold", title))
      place(dy: 590pt, render_authors)
      
      place(dy: 640pt, text(size: 12pt, string_date))
    }
  }

  {  
    align(
      top+right,
      table(
        columns: 2 * (115pt, ),
        align: top + left, 
        rows: (20pt, 20pt, 20pt, 40pt),
        stroke: (dash: "densely-dotted", thickness: 0.75pt), 
        [Data da Receção], [], 
        [Responsável], [], 
        [Avaliação], [],
        [Observações], [],
      )
    )
    
    align(bottom + left, {
      text(size: 18pt, weight: "bold", title)
      v(30pt)
      set text(size: 12pt)
      render_authors
      v(10pt)
      string_date
    })
  }
  
}
