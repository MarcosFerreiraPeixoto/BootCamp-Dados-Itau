CREATE TABLE IF NOT EXISTS categoria(
							cd_categoria SERIAL PRIMARY KEY,
                            nm_categoria VARCHAR(100) NOT NULL                            
);


CREATE TABLE IF NOT EXISTS fabricante(
							cd_fabricante SERIAL PRIMARY KEY,
                            nm_fabricante VARCHAR(100) NOT NULL                             
);


CREATE TABLE IF NOT EXISTS formas_pagamento(
							cd_forma_pag SERIAL PRIMARY KEY,
                            desc_forma_pag VARCHAR(30) NOT NULL
);


CREATE TABLE IF NOT EXISTS produto(
							cd_produto SERIAL PRIMARY KEY,
                            desc_produto VARCHAR(100) NOT NULL,
                            cd_categoria int,
                            cd_fabricante int,
                            FOREIGN KEY (cd_categoria) REFERENCES categoria(cd_categoria),
                            FOREIGN KEY (cd_fabricante) REFERENCES fabricante(cd_fabricante)                            
);

CREATE TABLE IF NOT EXISTS vendedor(
							cd_vendedor SERIAL PRIMARY KEY,
                            nm_vendedor VARCHAR(100) NOT NULL,
                            salario DECIMAL(10, 2) NOT NULL,
                            percentual_comissao INT NOT NULL                                                        
);

CREATE TABLE IF NOT EXISTS pedido(
							nr_pedido SERIAL PRIMARY KEY,
                            cd_vendedor INT NOT NULL,
                            dt_pedido TIMESTAMP NOT NULL,
                            cd_forma_pag INT NOT NULL,
                            FOREIGN KEY (cd_vendedor) REFERENCES vendedor(cd_vendedor),
                            FOREIGN KEY (cd_forma_pag) REFERENCES formas_pagamento(cd_forma_pag)
);

CREATE TABLE IF NOT EXISTS item_pedido(
							nr_item_pedido SERIAL NOT NULL PRIMARY KEY,
                            preco_item DECIMAL(7,2) NOT NULL,
                            qnt_item_pedido INT NOT NULL,
							nr_pedido INT NOT NULL,
                            cd_produto INT NOT NULL,
                            FOREIGN KEY (nr_pedido) REFERENCES pedido(nr_pedido),
                            FOREIGN KEY (cd_produto) REFERENCES produto(cd_produto)
);



