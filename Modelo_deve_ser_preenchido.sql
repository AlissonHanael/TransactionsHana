-- TRAVA MODELO NOTA FISCAL DE ENTRADA DEVE SER OBRIGATÓRIO -- funcionando
-- ALISSON GAIO 26/03/2024 --
if(:object_type = '18' and (:transaction_type = 'A' or :transaction_type = 'U')) then
DECLARE cont INT;


	SELECT count(1) into cont
	FROM OPCH
	WHERE coalesce("Model", '') = '0'   
	and "DocEntry" = :list_of_cols_val_tab_del;
	    
	    if cont > 0 then
	        error := -2;
	        error_message := 'Campo "Modelo" deve ser preenchido em Notas Fiscais de Entrada.';
	    end if;   

end if;