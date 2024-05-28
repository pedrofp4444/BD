#let normalização = {
  [
    == Normalização de Dados

    A normalização de uma base de dados é um processo crucial na execução de um sistema de gestão de base de dados relacional. O objetivo principal da normalização é organizar os dados de forma a minimizar a redundância, ambiguidade e inconsistência, garantindo, em simultâneo, a integridade da informação e facilitando as operações de consulta e manipulação da mesma.
    
    Existem várias formas normais, habitualmente descritas pela nomenclatura 1NF(Primeira Forma Normal), 2NF(Segunda Forma Normal), 3NF(Terceira Forma Normal), entre outras. Cada uma destas formas normais aborda diferentes tipos de problemas de difusão e dependências funcionais entre os atributos das tabelas.
    
    Na Primeira Forma Normal (1NF), as tabelas são organizadas de forma a que cada célula contenha apenas um valor indivisível, e não listas de valores separados por vírgulas, pontos, ou outros delimitadores. Adicionalmente, cada tabela deve ter uma chave primária única que a identifica de forma exclusiva. Por exemplo, na tabela de Caso verifica-se a garantia de valores indivisíveis e a unicidade da chave primária. Após a análise atenta do modelo lógico em produção, verifica-se o cumprimento desta regra de normalização.
    
    Na Segunda Forma Normal (2NF), todas as dependências parciais são eliminadas, o que significa que cada atributo na tabela deve depender totalmente da chave primária e não apenas de parte dela. Para corroborar esta regra, exemplificando, na tabela de Número de telemóvel, o atributo “Número de telemóvel” subordina-se à chave primária correspondente. Valida-se então esta norma não obstante à confirmação da 1NF, de forma a respeitar a ordem de precedência estabelecida.
    
    Na Terceira Forma Normal (3NF), as dependências transitivas são eliminadas, ou seja, não deve haver atributos que dependam de outros que não seja chave primária da tabela em que se encontram definidos. Constata-se a veracidade desta norma no nosso modelo lógico, por exemplo, na tabela de Função, o atributo “Designação” depende só e apenas da chave primária.
    
    Ao considerar a homologação sequencial e progressiva destas três formas normais, confirma-se a validade do modelo lógico em produção e verificação. Complementarmente, existem mais fórmulas como a Forma Normal de Boyce-Codd (BCNF) ou Quarta e Quinta Formas Normais (4NF e 5NF) que impõem uma  especificidade e detalhe superior na minimização de redundâncias e irregularidades, no entanto, descartámo-las dado a complexidade excessiva no âmbito do nosso desenvolvimento.
  ]
}