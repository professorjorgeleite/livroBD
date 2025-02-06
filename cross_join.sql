SHOW TABLES;


SELECT * FROM times;
#CROSS JOIN
INSERT INTO jogos2(id_mandante,id_visitante)
SELECT times.id_time,t.id_time AS id2 FROM times 
CROSS JOIN times AS t
WHERE times.nome_time <> t.nome_time;


UPDATE jogos2 SET rodada = MOD(idjogos,19)+1;


SELECT t1.nome_time,t2.nome_time, j.rodada  FROM times 
AS t1 INNER JOIN jogos2 AS j
ON t1.id_time = j.id_mandante INNER JOIN times t2
ON t2.id_time = j.id_visitante 
ORDER BY j.rodada;

SELECT rodada, COUNT(rodada) AS total FROM jogos2
GROUP BY rodada;


SELECT * FROM (1,2,3,4) AS t;