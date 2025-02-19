/*

DESENVOLVIDO POR ALISSON GAIO 
Obrigatoriedade de preenchimento do campo Centro de Custo em Diversos documentos de marketing

*/

IF(
	(
		object_type =  '13' OR  -- OINV 
		object_type =  '14' OR  -- ORIN 
		object_type =  '15' OR  -- ODLN 
		object_type =  '16' OR  -- ORDN 
		object_type =  '17' OR  -- ORDR 
		object_type =  '18' OR  -- OPCH 
		object_type =  '19' OR  -- ORPC 
		object_type =  '20' OR  -- OPDN 
		object_type =  '21' OR  -- ORPD 
		object_type =  '22' OR  -- OPOR 
		object_type =  '23' OR  -- OQUT 
		object_type =  '59' OR  -- OIGN 
		object_type =  '60' OR  -- OIGE 
	)
	and (:transaction_type = 'A' or :transaction_type = 'U')) THEN

	SELECT CASE 
		WHEN object_type =  '13' THEN (SELECT COUNT(*) FROM INV1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."OcrCode",'')='')
		WHEN object_type =  '14' THEN (SELECT COUNT(*) FROM RIN1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."OcrCode",'')='')
		WHEN object_type =  '15' THEN (SELECT COUNT(*) FROM DLN1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."OcrCode",'')='')
		WHEN object_type =  '16' THEN (SELECT COUNT(*) FROM RDN1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."OcrCode",'')='')
		WHEN object_type =  '17' THEN (SELECT COUNT(*) FROM RDR1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."OcrCode",'')='')
		WHEN object_type =  '18' THEN (SELECT COUNT(*) FROM PCH1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."OcrCode",'')='')
		WHEN object_type =  '19' THEN (SELECT COUNT(*) FROM RPC1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."OcrCode",'')='')
		WHEN object_type =  '20' THEN (SELECT COUNT(*) FROM PDN1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."OcrCode",'')='')
		WHEN object_type =  '21' THEN (SELECT COUNT(*) FROM RPD1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."OcrCode",'')='')
		WHEN object_type =  '22' THEN (SELECT COUNT(*) FROM POR1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."OcrCode",'')='')
		WHEN object_type =  '23' THEN (SELECT COUNT(*) FROM QUT1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."OcrCode",'')='')
		WHEN object_type =  '59' THEN (SELECT COUNT(*) FROM IGN1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."OcrCode",'')='')
		WHEN object_type =  '60' THEN (SELECT COUNT(*) FROM IGE1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."OcrCode",'')='')
		WHEN object_type =  '30' THEN (SELECT COUNT(*) FROM JDT1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."ProfitCode",'')='')
		
	END INTO bExists
	FROM Dummy;
			
	IF (bExists > 0) THEN
        error := 990001;
		error_message := 'Campo "Centro de Custo" deve ser preenchido nas contas de custo, despesa e receita.';
	END IF;

END IF;

/*

DESENVOLVIDO POR ALISSON GAIO 
Obrigatoriedade de preenchimento do campo Projeto em Diversos documentos de marketing

*/

IF(
	(
		object_type =  '13' OR  -- OINV 
		object_type =  '14' OR  -- ORIN 
		object_type =  '15' OR  -- ODLN 
		object_type =  '16' OR  -- ORDN 
		object_type =  '17' OR  -- ORDR 
		object_type =  '18' OR  -- OPCH 
		object_type =  '19' OR  -- ORPC 
		object_type =  '20' OR  -- OPDN 
		object_type =  '21' OR  -- ORPD 
		object_type =  '22' OR  -- OPOR 
		object_type =  '23' OR  -- OQUT 
		object_type =  '59' OR  -- OIGN 
		object_type =  '60' OR  -- OIGE 
	)
	and (:transaction_type = 'A' or :transaction_type = 'U')) THEN

	SELECT CASE 
		WHEN object_type =  '13' THEN (SELECT COUNT(*) FROM INV1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."Project",'')='')
		WHEN object_type =  '14' THEN (SELECT COUNT(*) FROM RIN1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."Project",'')='')
		WHEN object_type =  '15' THEN (SELECT COUNT(*) FROM DLN1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."Project",'')='')
		WHEN object_type =  '16' THEN (SELECT COUNT(*) FROM RDN1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."Project",'')='')
		WHEN object_type =  '17' THEN (SELECT COUNT(*) FROM RDR1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."Project",'')='')
		WHEN object_type =  '18' THEN (SELECT COUNT(*) FROM PCH1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."Project",'')='')
		WHEN object_type =  '19' THEN (SELECT COUNT(*) FROM RPC1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."Project",'')='')
		WHEN object_type =  '20' THEN (SELECT COUNT(*) FROM PDN1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."Project",'')='')
		WHEN object_type =  '21' THEN (SELECT COUNT(*) FROM RPD1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."Project",'')='')
		WHEN object_type =  '22' THEN (SELECT COUNT(*) FROM POR1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."Project",'')='')
		WHEN object_type =  '23' THEN (SELECT COUNT(*) FROM QUT1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."Project",'')='')
		WHEN object_type =  '59' THEN (SELECT COUNT(*) FROM IGN1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."Project",'')='')
		WHEN object_type =  '60' THEN (SELECT COUNT(*) FROM IGE1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."Project",'')='')
		WHEN object_type =  '30' THEN (SELECT COUNT(*) FROM JDT1 T0 WHERE (T0."AcctCode" LIKE '5%' OR T0."AcctCode" LIKE '4%' OR T0."AcctCode" LIKE '3%') AND T0."DocEntry" = :list_of_cols_val_tab_del AND IFNULL(T0."Project",'')='')
		
	END INTO bExists
	FROM Dummy;
			
	IF (bExists > 0) THEN
        error := 990002;
		error_message := 'Campo "Projeto" deve ser preenchido nas contas de custo, despesa e receita.';
	END IF;

END IF;
