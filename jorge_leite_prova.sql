#q1
SELECT veiculos.modelo, veiculos.cor,veiculos.ano,
apartamentos.idapartamento, apartamentos.numero
FROM veiculos INNER JOIN apartamentos
ON veiculos.idapartamento= apartamentos.idapartamento;
#q3
SELECT apartamentos.idapartamento, apartamentos.numero,
count(veiculos.modelo) AS total
FROM veiculos right JOIN apartamentos
ON veiculos.idapartamento= apartamentos.idapartamento
GROUP BY apartamentos.idapartamento;

#q2
SELECT apartamentos.idapartamento, apartamentos.numero,
apartamentos.metragem, predios.idpredio, predios.nomepredio
FROM apartamentos INNER JOIN predios
ON apartamentos.idpredio = predios.idpredio;

#q8
SELECT avg(apartamentos.metragem) AS media, 
predios.idpredio, predios.nomepredio
FROM apartamentos INNER JOIN predios
ON apartamentos.idpredio = predios.idpredio
GROUP BY predios.idpredio;

#q4
SELECT moradores.idmorador, moradores.nome,
moradores.cpf,moradores.sexo, moradores.rendafamiliar,
COUNT(parentes.idparente) AS total FROM moradores
left JOIN parentes 
ON moradores.idmorador =parentes.idmorador
GROUP BY moradores.idmorador;
#q11
SELECT moradores.idmorador, moradores.nome,
moradores.cpf,
parentes.nome AS nomeparente, parentes.sexo FROM moradores
left JOIN parentes 
ON moradores.idmorador =parentes.idmorador;
#q6 dados do parente mais velho por morador

SELECT moradores.idmorador, moradores.nome,
moradores.cpf,
parentes.nome AS nomeparente, parentes.sexo,
parentes.datanascimento FROM moradores
left JOIN parentes 
ON moradores.idmorador =parentes.idmorador
GROUP BY moradores.idmorador
;
#q5 renda minima por predio
SELECT predios.idpredio, predios.nomepredio,
min(moradores.rendafamiliar) AS maispobre
FROM apartamentos INNER JOIN predios
ON apartamentos.idpredio = predios.idpredio
INNER JOIN moradores ON apartamentos.idapartamento
= moradores.idapartamento GROUP BY predios.idpredio;
#q9 mostra a soma das rendas de cada predio
SELECT predios.idpredio, predios.nomepredio,
sum(moradores.rendafamiliar) AS soma
FROM apartamentos INNER JOIN predios
ON apartamentos.idpredio = predios.idpredio
INNER JOIN moradores ON apartamentos.idapartamento
= moradores.idapartamento GROUP BY predios.idpredio;
#q10 - moradores do sexdo masculino que moram no porto
SELECT predios.idpredio, predios.nomepredio,
moradores.nome,moradores.sexo
FROM apartamentos INNER JOIN predios
ON apartamentos.idpredio = predios.idpredio
INNER JOIN moradores ON apartamentos.idapartamento
= moradores.idapartamento 
WHERE predios.nomepredio = 'Porto' AND moradores.sexo ='m';

#7 - moradores por rua
SELECT ruas.nomerua, count(moradores.sexo) AS total
FROM apartamentos INNER JOIN predios
ON apartamentos.idpredio = predios.idpredio
left JOIN moradores ON apartamentos.idapartamento
= moradores.idapartamento 
INNER JOIN ruas ON ruas.idrua = predios.idrua
GROUP BY ruas.idrua;


#12 - veiculos por rua
# eh igual a sete e troca veiculo por moorador
SELECT ruas.nomerua, count(veiculos.placa) AS total
FROM apartamentos INNER JOIN predios
ON apartamentos.idpredio = predios.idpredio
left JOIN veiculos ON apartamentos.idapartamento
= veiculos.idapartamento 
INNER JOIN ruas ON ruas.idrua = predios.idrua
GROUP BY ruas.idrua;

