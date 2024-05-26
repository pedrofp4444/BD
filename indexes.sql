-- Criação de um índice para a coluna Terreno_ID na tabela Caso
CREATE INDEX index_caso_terreno_id ON Caso(Terreno_ID);

-- Criação de um índice para a coluna Caso_ID na tabela Suspeito
CREATE INDEX idx_suspeito_caso_id ON Suspeito(Caso_ID);

-- Criação de um índice para a coluna Funcionário_ID na tabela Suspeito
CREATE INDEX idx_suspeito_funcionario_id ON Suspeito(Funcionário_ID);