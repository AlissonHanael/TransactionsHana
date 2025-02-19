---- TRAVA DOCUMENTO DE ENTRADA DUPLICADO --- 
-- ALISSON GAIO --
IF (
    :object_type = '20'
    or :object_type = '21'
    or :object_type = '112'
    or -- trava na table de esboço
    :object_type = '19'
    or :object_type = '15'
    or :object_type = '16'
    or :object_type = '13'
    or :object_type = '14'
    AND (
        :transaction_type = 'U'
        OR :transaction_type = 'A'
    )
)
AND :error = 0 THEN
DECLARE tab VARCHAR(3);
DECLARE query VARCHAR(1000);
declare count1 int;
SELECT CASE
        WHEN :object_type = '20' THEN 'PDN'
        WHEN :object_type = '21' THEN 'RPD'
        WHEN :object_type = '112' THEN 'DRF'
        WHEN :object_type = '19' THEN 'RPC'
        WHEN :object_type = '15' THEN 'DLN'
        WHEN :object_type = '16' THEN 'RDN'
        WHEN :object_type = '13' THEN 'INV'
        WHEN :object_type = '14' THEN 'RIN'
    END INTO tab
FROM dummy;
IF :object_type = '112' THEN query := 'SELECT COUNT(T1."DocNum")
	          FROM "O' || :tab || '" T0
	          INNER JOIN "O' || :tab || '" T1 ON 
	          T1."CardCode" = T0."CardCode" AND
	          T1."Serial" = T0."Serial" AND
	          T1."Model" = T0."Model" AND
	          T1."TaxDate" = T0."TaxDate"
	          WHERE T0."DocEntry" = ' || :list_of_cols_val_tab_del || '
	          AND T0."CANCELED" = ''N''
	          AND T1."CANCELED" = ''N''  
	          AND T1."WddStatus" NOT IN (''N'',''C'' )
	          AND T0."SeqCode" IN (-1, -2)';
-- status de documento de rascunho : C (cancelado), N (Recusado), W (pendente), Y (autorizado), - (sem status)
ELSE query := 'SELECT COUNT(T1."DocNum")
	          FROM "O' || :tab || '" T0
	          INNER JOIN "O' || :tab || '" T1 ON 
	          T1."CardCode" = T0."CardCode" AND
	          T1."Serial" = T0."Serial" AND
	          T1."Model" = T0."Model" AND
	          T1."TaxDate" = T0."TaxDate"
	          WHERE T0."DocEntry" = ' || :list_of_cols_val_tab_del || '
	          AND T0."CANCELED" = ''N''
	          AND T1."CANCELED" = ''N''
	          AND T0."SeqCode" IN (-1, -2)';
END IF;
execute immediate query into count1;
IF (count1 > 1) THEN error := '-1';
error_message := 'Já existe nº da Nota Fiscal para esse Fornecedor';
END IF;
END IF;
---- TRAVA LINHAS DE DOCUMENTO SEM PROJETO DINAMICO -----
--- DESENVOLVIDO POR ALISSON GAIO ---
--- INSERIDO POR: SEU NOME AQUI - DATA -----
IF (
    :object_type = '20'
    or :object_type = '21'
    or :object_type = '18'
    or :object_type = '19'
    or :object_type = '15'
    or :object_type = '16'
    or :object_type = '13'
    or :object_type = '14'
    AND (
        :transaction_type = 'U'
        OR :transaction_type = 'A'
    )
)
AND :error = 0 THEN
DECLARE tab VARCHAR(3);
DECLARE query VARCHAR(1000);
DECLARE contaLinhas int;
DECLARE contaProjetos int;
SELECT CASE
        WHEN :object_type = '20' THEN 'PDN'
        WHEN :object_type = '21' THEN 'RPD'
        WHEN :object_type = '18' THEN 'PCH'
        WHEN :object_type = '19' THEN 'RPC'
        WHEN :object_type = '15' THEN 'DLN'
        WHEN :object_type = '16' THEN 'RDN'
        WHEN :object_type = '13' THEN 'INV'
        WHEN :object_type = '14' THEN 'RIN'
    END INTO tab
FROM dummy;
query := 'SELECT COUNT("LineNum"), COUNT("Project") FROM ' || tab || '1 WHERE "DocEntry" = ' || :list_of_cols_val_tab_del || '';
EXECUTE IMMEDIATE query INTO contaLinhas,
contaProjetos;
IF (contaProjetos < contaLinhas) THEN error := '-1';
error_message := 'O Campo de projeto deve ser preenchido';
END IF;
END IF;

