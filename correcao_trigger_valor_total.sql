SELECT * FROM itens;
SELECT * FROM pedidos;
DESC pedidos;

delimiter $$
DROP TRIGGER if EXISTS tgAtualizaValorTotal;
CREATE TRIGGER tgAtualizaValorTotal AFTER INSERT ON itens
FOR EACH ROW
BEGIN
   DECLARE valor FLOAT;
   SELECT  SUM(itens.quantidade * pizzas.preco) into valor
   FROM itens INNER JOIN pizzas ON itens.idpizzas = pizzas.idpizzas
	WHERE itens.idpedidos = NEW.idpedidos AND itens.idpizzas =NEW.idpizzas;
	
	UPDATE pedidos SET valor_total = valor_total + valor
	WHERE idpedidos = NEW.idpedidos;
end
$$

SELECT itens.idpedidos, SUM(itens.quantidade * pizzas.preco) AS total
FROM itens INNER JOIN pizzas GROUP BY itens.idpedidos;


INSERT INTO pedidos (idsocios,idatendentes,datapedido,valor_total)
VALUES (1,1,CURRENT_DATE,50);

INSERT INTO itens VALUES (91,1,20,1);
SELECT * FROM pedidos;
SELECT * FROM pizzas;


delimiter $$
DROP TRIGGER if EXISTS tgAtualizaValorTotalDel;
CREATE TRIGGER tgAtualizaValorTotalDel before delete ON itens
FOR EACH ROW
BEGIN
   DECLARE valor FLOAT;
   SELECT  SUM(itens.quantidade * pizzas.preco) into valor
   FROM itens INNER JOIN pizzas ON itens.idpizzas = pizzas.idpizzas
	WHERE itens.idpedidos = OLD.idpedidos AND itens.idpizzas =OLD.idpizzas;
	
	UPDATE pedidos SET valor_total = valor_total - valor
	WHERE idpedidos = OLD.idpedidos;
end
$$

DELETE FROM itens WHERE idpedidos=91 AND idpizzas=1;