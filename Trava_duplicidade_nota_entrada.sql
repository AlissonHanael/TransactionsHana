--Aviso de Duplicidade de NF Entrada / Recebimento / Devolução 
--Criado por: Flávia Schmidt
--Data: 21/01/2021


IF (:object_type ='18' AND  (:transaction_type = 'U' OR :transaction_type = 'A')) AND :error = 0
THEN
  	declare count1 int;
	SELECT
		COUNT(T1."DocNum") into count1
	FROM "OPCH" T0
	INNER JOIN "OPCH" T1 ON 
		T1."CardCode" = T0."CardCode" AND -- Parceiro
		--T1."SeqCode" = T0."SeqCode" AND -- Externo ou Manual
		T1."Serial" = T0."Serial" AND -- Nº da Nota 
		T1."Model" = T0."Model" --AND-- Modelo da nota (remover do antigo pra conseguir entrar com um novo)
	WHERE T0."DocEntry" = :list_of_cols_val_tab_del 
	AND T0."CANCELED" ='N' 
	AND T0."SeqCode" in (-1, -2);

 IF (count1 > 1)
 THEN
 	error := '-1';
	error_message := 'Já existe nº da Nota Fiscal de Entrada para esse Fornecedor';
 END IF;
END IF;